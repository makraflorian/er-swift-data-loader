//
//  CalculationView.swift
//  ERSwiftDataLoader
//
//  Created by Makra Flórián Róbert on 08/08/2024.
//

import SwiftUI
import SwiftData

struct CalculationView: View {
    
    @Environment(\.weaponsContainer) var weaponsContainer: ModelContainer
    
    @MainActor
    func mainCalculation() {
        
        // goofy aaah planning
        
        // i want to have hotswappable classes: the class stats and tha character stats stored separately
        // and a computed property will add things together, or on the fly when calculating the weapon damage
        // or have a cache property (see comment in the class file)
        // (side effect: the level will change) / OR the other approach is reset everything (no go)
        
        // fetch the character for weapon id, -> weapon -> get the actual weapon from affinity ->
        // -> get all the attackbase*element* and filter out the nonzero values -> get the element scaing for that id
        // -> somehow switch the nonzero elements and get the booleans (brainrot) -> get the upgrade data
        
        
        // MARK: variables (maybe optionals dunno rn)
        
        
        
        var physicalResult: Double = 0.0
        var magicResult: Double = 0.0
        var fireResult: Double = 0.0
        var lightningResult: Double = 0.0
        var holyResult: Double = 0.0
        
        var damageResult: Double = 0.0
        
        
        
        // MARK: FetchDescriptors and DB things
        
        // helper class
        let character: CharacterClass? = fetchData(modelContext: weaponsContainer.mainContext,
                                  predicate: #Predicate { char in char.classId == 100 })
        
        // dagger
        let weapon: Weapon? = fetchData(modelContext: weaponsContainer.mainContext,
                                  predicate: #Predicate { weap in weap.weaponId == 1000000 })
        
        // cold dagger
        let weaponWithAffinity = weapon?.weaponAffinities?.first(where: { $0.weaponId == 1000900 })
        
        // cold dagger +5
        let weaponUpgrade: WeaponUpgrade? = fetchData(modelContext: weaponsContainer.mainContext,
                                  predicate: #Predicate { upgrade in upgrade.reinforceTypeId == 905 })
        
        // MARK: shit calculations
        var physicalAttack = weaponWithAffinity!.attackBasePhysics * weaponUpgrade!.physicsAtkRate
        print(weaponUpgrade?.physicsAtkRate ?? 0.0)
        var magicAttack = weaponWithAffinity!.attackBaseMagic * weaponUpgrade!.magicAtkRate
        var fireAttack = weaponWithAffinity!.attackBaseFire * weaponUpgrade!.fireAtkRate
        var lightningAttack = weaponWithAffinity!.attackBaseThunder * weaponUpgrade!.thunderAtkRate
        var holyAttack = weaponWithAffinity!.attackBaseDark * weaponUpgrade!.darkAtkRate
        

//        var dexScaling = weaponWithAffinity?.correctAgility ?? 0.0 * (weaponUpgrade?.correctAgilityRate ?? 0.0)
//        var intScaling = weaponWithAffinity?.correctMagic ?? 0.0 * (weaponUpgrade?.correctMagicRate ?? 0.0)
//        var faiScaling = weaponWithAffinity?.correctFaith ?? 0.0 * (weaponUpgrade?.correctFaithRate ?? 0.0)
//        var arcScaling = weaponWithAffinity?.correctLuck ?? 0.0 * (weaponUpgrade?.correctLuckRate ?? 0.0)
        
        
        let elementScaling: ElementScaling? = fetchData(modelContext: weaponsContainer.mainContext,
                                  predicate: #Predicate { scaling in scaling.rowId == 10000 })
        
        
        if ((weaponWithAffinity?.attackBasePhysics) != nil) {
            // calcCorrect
            let calcCorrectGraph: CalcCorrectGraph? = fetchData(modelContext: weaponsContainer.mainContext,
                                      predicate: #Predicate { calcCorrect in calcCorrect.graphId == 0 })
            
            //
            let physicalScalingResult = getScalingStat(character: character!,
                                            elementScalingStat: elementScaling!.physical,
                                            calcCorrectGraph: calcCorrectGraph!,
                                            baseAttack: physicalAttack,
                                            weaponAffinity: weaponWithAffinity!,
                                            weaponUpgrade: weaponUpgrade!)
            
            physicalResult = physicalAttack + physicalScalingResult
        }
        
    }
    

    // get the corresponding character stat (case .int return Character.intelligence) OR NOT XD
    // need weaponAffinity and upgrade data for corresponding stat scale calc and return it
    func getScalingStat(character: CharacterClass,
                        elementScalingStat: [ElementScaling.Stats],
                        calcCorrectGraph: CalcCorrectGraph,
                        baseAttack: Double,
                        weaponAffinity: WeaponAffinity,
                        weaponUpgrade: WeaponUpgrade) -> Double {
        
        var output: Double = 0.0
        
        for element in elementScalingStat {
            switch element {
            case .str:
                let characterAttribute = Double(character.stats?.strength ?? 0)
                let attributeScaling = (weaponAffinity.correctStrength * weaponUpgrade.correctStrengthRate) / 100
                let elementalScaling = calcScaing(pairs: calcCorrectGraph.pairs, characterAttribute: characterAttribute)
                output += baseAttack * attributeScaling * elementalScaling
            case .dex:
                let characterAttribute = Double(character.stats?.dexterity ?? 0)
                let attributeScaling = (weaponAffinity.correctAgility * weaponUpgrade.correctAgilityRate) / 100
                let elementalScaling = calcScaing(pairs: calcCorrectGraph.pairs, characterAttribute: characterAttribute)
                output += baseAttack * attributeScaling * elementalScaling
            case .int:
                let characterAttribute = Double(character.stats?.intelligence ?? 0)
                let attributeScaling = (weaponAffinity.correctMagic * weaponUpgrade.correctMagicRate) / 100
                let elementalScaling = calcScaing(pairs: calcCorrectGraph.pairs, characterAttribute: characterAttribute)
                output += baseAttack * attributeScaling * elementalScaling
            case .fai:
                let characterAttribute = Double(character.stats?.faith ?? 0)
                let attributeScaling = (weaponAffinity.correctFaith * weaponUpgrade.correctFaithRate) / 100
                let elementalScaling = calcScaing(pairs: calcCorrectGraph.pairs, characterAttribute: characterAttribute)
                output += baseAttack * attributeScaling * elementalScaling
            case .arc:
                let characterAttribute = Double(character.stats?.arcane ?? 0)
                let attributeScaling = (weaponAffinity.correctLuck * weaponUpgrade.correctLuckRate) / 100
                let elementalScaling = calcScaing(pairs: calcCorrectGraph.pairs, characterAttribute: characterAttribute)
                output += baseAttack * attributeScaling * elementalScaling
            }
        }
        
        return output
    }
    
    func getPairs(pairs: [Pairs], characterAttribute: Double) -> (Pairs, Pairs) {
        if let index = pairs.firstIndex(where: { characterAttribute < $0.stageMaxVal }) {
            let pairMax = pairs[index]
            let pairMin = pairs[index-1]
            
            return (pairMin, pairMax)
        }
        
        return (pairs[0], pairs[1])
    }
    
    func calcScaing( pairs: [Pairs], characterAttribute: Double) -> Double {
        
        let (pairMin, pairMax) = getPairs(pairs: pairs, characterAttribute: characterAttribute)
        
        let ratio = (characterAttribute - pairMin.stageMaxVal) / (pairMax.stageMaxVal - pairMin.stageMaxVal)
        var growth = 0.0
        
        if pairMin.adjPt_maxGrowVal > 0.0 {
            growth = pow(ratio, pairMin.adjPt_maxGrowVal)
        } else {
            growth = 1.0 - pow((1 - ratio), abs(pairMin.adjPt_maxGrowVal))
        }
        
        return (pairMin.stageMaxGrowVal + ((pairMax.stageMaxGrowVal - pairMin.stageMaxGrowVal) * growth)) / 100
    }
    
    var body: some View {
        Text("Hello, World!")
        Button("Calc", systemImage: "trash") {
            mainCalculation()
        }
    }
}

//#Preview {
//    CalculationView()
//}
