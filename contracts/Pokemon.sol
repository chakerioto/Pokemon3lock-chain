// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;

contract Pokemon {
    event NewPokemon(
        uint256 id,
        string name,
        uint256 hp,
        uint256 attack,
        string imageUrl
    );

    struct Pokemon {
        string name;
        uint256 hp;
        uint256 attack;
        string imageUrl;
    }

    Pokemon[] public pokemons;

    mapping(uint256 => address) public pokemonToOwner;
    mapping(address => uint256) ownerPokemonCount;

    function createPokemon(
        string memory _name,
        uint256 _hp,
        uint256 _attack,
        string memory _imageUrl
    ) public {
        uint256 id = pokemons.push(Pokemon(_name, _hp, _attack, _imageUrl)) - 1;
        emit NewPokemon(id, _name, _hp, _attack, _imageUrl);
    }

    function getPokemonsByOwner(address _owner)
        external
        view
        returns (uint256[] memory)
    {
        uint256[] memory result = new uint256[](ownerPokemonCount[_owner]);
        uint256 counter = 0;
        for (uint256 i = 0; i < pokemons.length; i++) {
            if (pokemonToOwner[i] == _owner) {
                result[counter] = i;
                counter++;
            }
        }
        return result;
    }
}
