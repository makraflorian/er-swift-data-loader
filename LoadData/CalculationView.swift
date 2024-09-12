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
    
    @State var physicalAttack = 0.0
    @State var magicAttack = 0.0
    @State var fireAttack = 0.0
    @State var lightningAttack = 0.0
    @State var holyAttack = 0.0
    
    @State var physicalScalingResult = 0.0
    @State var magicScalingResult = 0.0
    @State var fireScalingResult = 0.0
    @State var lightningScalingResult = 0.0
    @State var holyScalingResult = 0.0
    
    @State var damageResult = 0.0
    
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
        
        var physicalResult = 0.0
        var magicResult = 0.0
        var fireResult = 0.0
        var lightningResult = 0.0
        var holyResult = 0.0
        
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
        physicalAttack = weaponWithAffinity!.attackBasePhysics * weaponUpgrade!.physicsAtkRate
        magicAttack = weaponWithAffinity!.attackBaseMagic * weaponUpgrade!.magicAtkRate
        fireAttack = weaponWithAffinity!.attackBaseFire * weaponUpgrade!.fireAtkRate
        lightningAttack = weaponWithAffinity!.attackBaseThunder * weaponUpgrade!.thunderAtkRate
        holyAttack = weaponWithAffinity!.attackBaseDark * weaponUpgrade!.darkAtkRate
        
        
        let elementScaling: ElementScaling? = fetchData(modelContext: weaponsContainer.mainContext,
                                                        predicate: #Predicate { scaling in scaling.rowId == 10000 })
        
        
        if ((weaponWithAffinity?.attackBasePhysics) != nil) {
            let calcCorrectGraph: CalcCorrectGraph? = fetchData(modelContext: weaponsContainer.mainContext,
                                                                predicate: #Predicate { calcCorrect in calcCorrect.graphId == 0 })
            
            physicalScalingResult = getScalingStat(character: character!,
                                                       elementScalingStat: elementScaling!.physical,
                                                       calcCorrectGraph: calcCorrectGraph!,
                                                       baseAttack: physicalAttack,
                                                       weaponAffinity: weaponWithAffinity!,
                                                       weaponUpgrade: weaponUpgrade!)
            
            physicalResult = physicalAttack + physicalScalingResult
        }
        
        if ((weaponWithAffinity?.attackBaseMagic) != nil) {
            let calcCorrectGraph: CalcCorrectGraph? = fetchData(modelContext: weaponsContainer.mainContext,
                                                                predicate: #Predicate { calcCorrect in calcCorrect.graphId == 0 /* affinity.magicGraphid */})
            
            magicScalingResult = getScalingStat(character: character!,
                                                    elementScalingStat: elementScaling!.magic,
                                                    calcCorrectGraph: calcCorrectGraph!,
                                                    baseAttack: magicAttack,
                                                    weaponAffinity: weaponWithAffinity!,
                                                    weaponUpgrade: weaponUpgrade!)
            
            magicResult = magicAttack + magicScalingResult
        }
        
        if ((weaponWithAffinity?.attackBaseFire) != nil) {
            let calcCorrectGraph: CalcCorrectGraph? = fetchData(modelContext: weaponsContainer.mainContext,
                                                                predicate: #Predicate { calcCorrect in calcCorrect.graphId == 0 })
            
            fireScalingResult = getScalingStat(character: character!,
                                                   elementScalingStat: elementScaling!.fire,
                                                   calcCorrectGraph: calcCorrectGraph!,
                                                   baseAttack: fireAttack,
                                                   weaponAffinity: weaponWithAffinity!,
                                                   weaponUpgrade: weaponUpgrade!)
            
            fireResult = fireAttack + fireScalingResult
        }
        
        if ((weaponWithAffinity?.attackBaseThunder) != nil) {
            let calcCorrectGraph: CalcCorrectGraph? = fetchData(modelContext: weaponsContainer.mainContext,
                                                                predicate: #Predicate { calcCorrect in calcCorrect.graphId == 0 })
            
            lightningScalingResult = getScalingStat(character: character!,
                                                        elementScalingStat: elementScaling!.lightning,
                                                        calcCorrectGraph: calcCorrectGraph!,
                                                        baseAttack: lightningAttack,
                                                        weaponAffinity: weaponWithAffinity!,
                                                        weaponUpgrade: weaponUpgrade!)
            
            lightningResult = lightningAttack + lightningScalingResult
        }
        
        if ((weaponWithAffinity?.attackBaseDark) != nil) {
            let calcCorrectGraph: CalcCorrectGraph? = fetchData(modelContext: weaponsContainer.mainContext,
                                                                predicate: #Predicate { calcCorrect in calcCorrect.graphId == 0 })
            
            holyScalingResult = getScalingStat(character: character!,
                                                   elementScalingStat: elementScaling!.holy,
                                                   calcCorrectGraph: calcCorrectGraph!,
                                                   baseAttack: holyAttack,
                                                   weaponAffinity: weaponWithAffinity!,
                                                   weaponUpgrade: weaponUpgrade!)
            
            holyResult = holyAttack + holyScalingResult
        }
        
        damageResult = physicalResult + magicResult + fireResult + lightningResult + holyResult
        print(damageResult)
        
    }
    
    
    // get the corresponding character stat (case .int return Character.intelligence) OR NOT XD
    // need weaponAffinity and upgrade data for corresponding stat scale calc and return it
    func getScalingStat(character: CharacterClass,
                        elementScalingStat: [ElementScaling.Stats],
                        calcCorrectGraph: CalcCorrectGraph,
                        baseAttack: Double,
                        weaponAffinity: WeaponAffinity,
                        weaponUpgrade: WeaponUpgrade) -> Double {
        
        var output = 0.0
        
        for element in elementScalingStat {
            
            var characterAttribute = 0.0
            var attributeScaling = 0.0
            var elementalScaling = 0.0
            
            switch element {
            case .str:
                characterAttribute = Double(character.stats?.strength ?? 0)
                attributeScaling = (weaponAffinity.correctStrength * weaponUpgrade.correctStrengthRate) / 100.0
            case .dex:
                characterAttribute = Double(character.stats?.dexterity ?? 0)
                attributeScaling = (weaponAffinity.correctAgility * weaponUpgrade.correctAgilityRate) / 100.0
            case .int:
                characterAttribute = Double(character.stats?.intelligence ?? 0)
                attributeScaling = (weaponAffinity.correctMagic * weaponUpgrade.correctMagicRate) / 100.0
            case .fai:
                characterAttribute = Double(character.stats?.faith ?? 0)
                attributeScaling = (weaponAffinity.correctFaith * weaponUpgrade.correctFaithRate) / 100.0
            case .arc:
                characterAttribute = Double(character.stats?.arcane ?? 0)
                attributeScaling = (weaponAffinity.correctLuck * weaponUpgrade.correctLuckRate) / 100.0
            }
            
            elementalScaling = calcScaing(pairs: calcCorrectGraph.pairs, characterAttribute: characterAttribute)
            output += baseAttack * attributeScaling * elementalScaling
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
        
        return (pairMin.stageMaxGrowVal + ((pairMax.stageMaxGrowVal - pairMin.stageMaxGrowVal) * growth)) / 100.0
    }
    
    var body: some View {
        VStack {
            Text("Weapon Damage Calculation")
                .font(.title2)
            Text("Cold Dagger +5 - Str: 14, Dex: 14, Int: 40")
            Divider()
            Text("The damage numbers should be:")
            VStack {
                HStack {
                    Text("Physical")
                    Spacer()
                    Text("73 + 14")
                }
                HStack {
                    Text("Magic")
                    Spacer()
                    Text("62 + 22")
                }
                HStack {
                    Text("Fire")
                    Spacer()
                    Text("0 + 0")
                }
                HStack {
                    Text("Lightning")
                    Spacer()
                    Text("0 + 0")
                }
                HStack {
                    Text("Holy")
                    Spacer()
                    Text("0 + 0")
                }
            }
            .padding(EdgeInsets(top: 20, leading: 60, bottom: 10, trailing: 60))
            Text("Total Damage: 173")
                .font(.title3)
            Divider()
            Text("Calculated (without rounding):")
            VStack {
                HStack {
                    Text("Physical")
                    Spacer()
                    Text("\(physicalAttack) + \(physicalScalingResult)")
                }
                HStack {
                    Text("Magic")
                    Spacer()
                    Text("\(magicAttack) + \(magicScalingResult)")
                }
                HStack {
                    Text("Fire")
                    Spacer()
                    Text("\(fireAttack) + \(fireScalingResult)")
                }
                HStack {
                    Text("Lightning")
                    Spacer()
                    Text("\(lightningAttack) + \(lightningScalingResult)")
                }
                HStack {
                    Text("Holy")
                    Spacer()
                    Text("\(holyAttack) + \(holyScalingResult)")
                }
            }
            .padding(EdgeInsets(top: 10, leading: 60, bottom: 10, trailing: 60))
            Text("Total Damage: \(damageResult)")
                .font(.title3)
            Divider()
            Button("Calc", systemImage: "trash") {
                mainCalculation()
            }
        }
    }
}

//#Preview {
//    CalculationView()
//}
