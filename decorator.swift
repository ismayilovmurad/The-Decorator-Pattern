// Core Component: Character
protocol Character {
    func getHealth() -> Int
}

// Concrete Components: Orc and Elf
struct Orc: Character {

    func getHealth() -> Int {
        return 10
    }

}

struct Elf: Character {

    func getHealth() -> Int {
        return 5
    }

}

// Decorator: CharacterType
protocol CharacterType: Character {
    var base: Character { get }
}

// Concrete Decorators: Warlord and Epic
struct Warlord: CharacterType {

    let base: Character

    func getHealth() -> Int {
        return 50 + base.getHealth()
    }

    // New responsibility
    func battleCry() {
        print("RAWR")   
    }

}

struct Epic: CharacterType {

    let base: Character

    func getHealth() -> Int {
        return 30 + base.getHealth()
    }

}

let orc = Orc()
print(orc.getHealth())

let orcWarlord = Warlord(base: orc)
print(orcWarlord.getHealth())

let epicOrcWarlord = Epic(base: orcWarlord)
print(epicOrcWarlord.getHealth())

let doubleEpicOrcWarlord = Epic(base: epicOrcWarlord)
print(doubleEpicOrcWarlord.getHealth())

let elf = Elf()
print(elf.getHealth())

let elfWarlord = Warlord(base: elf)
print(elfWarlord.getHealth())

elfWarlord.battleCry()