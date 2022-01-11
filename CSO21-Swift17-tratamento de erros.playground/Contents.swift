//Tratamento de erros

enum LoginError: Error {
    case wrongLogin
    case wrongPassword
    case noInternetConnection
}




func login(userName: String, password: String) throws -> Bool {
    if checkInternetConnection() {
        if userName != "eric" {
            throw LoginError.wrongLogin
        }
        if password != "123456" {
            throw LoginError.wrongPassword
        }
        return true
    } else {
        throw LoginError.noInternetConnection
    }
}

func checkInternetConnection() -> Bool {
    return true
}
do {
    let loginResult = try login(userName: "eric", password: "123456")
} catch LoginError.wrongLogin {
    print("Nome do usuário invalido!")
} catch LoginError.wrongPassword {
    print("Senha invalida!")
}  catch LoginError.noInternetConnection {
    print("Sem Conexão!")
}
