import Combine

final class OptionsModelData: ObservableObject {
    @Published var imageOptionsRange = ["ASCII", "Image"]
    @Published var imageOptions: String = "ASCII"
    @Published var options: [String : Bool] = [
        "User" : true,
        "OS" : true,
        "Host" : true,
        "Kernel" : true,
        "Uptime" : true,
        "Packages" : true,
        "Shell" : true,
        "Resolution" : true,
        "DE" : true,
        "VM" : true,
        "WM Theme" : true,
        "Terminal" : true,
        "Terminal Font" : true,
        "CPU" : true,
        "GPU" : true,
        "Memory" : true,
        "Swatch" : true
    ]
    
//    @Published var user: String = "ASCII"
//    @Published var os: String = "ASCII"
//    @Published var host: String = "ASCII"
//    @Published var kernel: String = "ASCII"
//    @Published var uptime: String = "ASCII"
//    @Published var packages: String = "ASCII"
//    @Published var shell: String = "ASCII"
//    @Published var resolution: String = "ASCII"
//    @Published var de: String = "ASCII"
//    @Published var vm: String = "ASCII"
//    @Published var wmTheme: String = "ASCII"
//    @Published var terminal: String = "ASCII"
//    @Published var terminalFont: String = "ASCII"
//    @Published var cpu: String = "ASCII"
//    @Published var gpu: String = "ASCII"
//    @Published var memory: String = "ASCII"
//    @Published var swatch: [String] = ["ASCII"]
}
