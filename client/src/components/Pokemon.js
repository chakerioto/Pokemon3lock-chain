import React, { useState } from 'react';
import PokemonContract from "../contracts/Pokemon.json";


function Pokemon({ web3, accounts }) {
    const [myList, setmyList] = useState([]);

    const myPokemonContract = new web3.eth.Contract(
        PokemonContract.abi,
        '0x5fc841d79a5D1D675a4ECc561e705038e7187061'
    );



    const addNewPokemon = async () => {

        // Stores a given value, 5 by default.
        await myPokemonContract.methods.createPokemon('Ann', 12, 13, 'ddd').send({ from: accounts[0] });

        // Get the value from the contract to prove it worked.
        const response = await myPokemonContract.methods.getPokemonsByOwner(accounts[0]).call();

        console.log(response);

        // Update state with the result.
        // setmyList(response);
    };

    const handleClick = () => {
        addNewPokemon();
        console.log(myList);

    }



    return (
        <div className="Very">
            <button className='Good' onClick={() => handleClick()}></button>
        </div>
    )
}

export default Pokemon;
