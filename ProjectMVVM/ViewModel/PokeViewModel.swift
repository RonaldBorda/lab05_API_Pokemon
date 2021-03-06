//
//  PokeViewModel.swift
//  ProjectMVVM
//
//  Created by Linder Anderson Hassinger Solano    on 22/04/22.
//

import Foundation

class PokeViewModel {
    
    var pokemons = [Result]()
    
    let URL_API:String = "https://pokeapi.co/api/v2/pokemon"
    
    func getDataFromAPI() async{
        
//        1. Convertir string a URL
        guard let url = URL(string: URL_API) else {return}
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decoder = try? JSONDecoder().decode(Pokemon.self, from: data){
                DispatchQueue.main.async(execute:{
                    decoder.results.forEach {pokemon in
//        2. Agregar cada pokemon al array pokemons
                        self.pokemons.append(pokemon)
                    }
                })
            }
        }catch{
            print("error found")
        }
        
//        let task = URLSession.shared.dataTask(with: url) { data, responde, Error in
////        2. Validacion para saber si data es valido
//            if let data = data {
//                let decode = String(data:data, encoding: .utf8)
//                print(decode!)
//            }
//        }
//        task.resume()
    }
    
    
    
}
