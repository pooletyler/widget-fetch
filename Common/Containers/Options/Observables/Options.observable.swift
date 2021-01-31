import Combine

final class OptionsObservableObject: ObservableObject {
    let IMAGE_STRING : String = "Image"
    let ASCII_STRING : String = "ASCII"
    let USER_STRING : String = "User"
    let OS_STRING : String = "OS"
    let HOST_STRING : String = "Host"
    let KERNEL_STRING : String = "Kernel"
    let UPTIME_STRING : String = "Uptime"
    let PACKAGES_STRING : String = "Packages"
    let RESOLUTION_STRING : String = "Resolution"
    let FONT_STRING : String = "Font"
    let PROCESSOR_STRING : String = "CPU / GPU"
    let MEMORY_STRING : String = "Memory"
    let SWATCH_STRING : String = "Swatch"
    
    @Published var imageOptionsRange: [String]
    @Published var imageSelections: [String : Bool]
    @Published var optionsRange: [String]
    @Published var optionsIcons: [String : String]
    @Published var optionsSelections: [String : Bool]
    
    init() {
        self.imageOptionsRange = [ASCII_STRING, IMAGE_STRING]
        self.imageSelections = [
            ASCII_STRING : true,
            IMAGE_STRING : false
        ]
        self.optionsRange = [
            USER_STRING,
            OS_STRING,
            HOST_STRING,
            KERNEL_STRING,
            UPTIME_STRING,
            PACKAGES_STRING,
            RESOLUTION_STRING,
            FONT_STRING,
            PROCESSOR_STRING,
            MEMORY_STRING,
            SWATCH_STRING,
        ]
        self.optionsIcons = [
            USER_STRING : "person.fill",
            OS_STRING : "terminal.fill",
            HOST_STRING : "laptopcomputer.and.iphone",
            KERNEL_STRING : "gearshape.fill",
            UPTIME_STRING : "hourglass.bottomhalf.fill",
            PACKAGES_STRING : "shippingbox.fill",
            RESOLUTION_STRING : "4k.tv.fill",
            FONT_STRING : "character",
            PROCESSOR_STRING : "cpu",
            MEMORY_STRING : "memorychip",
            SWATCH_STRING : "paintbrush.fill"
        ]
        self.optionsSelections = [
            USER_STRING : true,
            OS_STRING : true,
            HOST_STRING : true,
            KERNEL_STRING : true,
            UPTIME_STRING : true,
            PACKAGES_STRING : true,
            RESOLUTION_STRING : true,
            FONT_STRING : true,
            PROCESSOR_STRING : true,
            MEMORY_STRING : true,
            SWATCH_STRING : true
        ]
    }
}

