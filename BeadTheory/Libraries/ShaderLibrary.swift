import MetalKit

enum VertexShaderTypes {
    case Basic
    case Instanced
    case Point
}

enum FragmentShaderTypes {
    case Basic
    case Point
}

class ShaderLibrary {
    public static var DefaultLibrary: MTLLibrary!
    
    private static var vertexShaders: [VertexShaderTypes: Shader] = [:]
    private static var fragmentShaders: [FragmentShaderTypes: Shader] = [:]
    
    public static func Initialize() {
        DefaultLibrary = Engine.Device.makeDefaultLibrary()
        createDefaultShaders()
    }
    
    public static func createDefaultShaders() {
        //Vertex Shaders
        vertexShaders.updateValue(Basic_VertexShader(), forKey: .Basic)
        vertexShaders.updateValue(Point_VertexShader(), forKey: .Point)
        vertexShaders.updateValue(Instanced_VertexShader(), forKey: .Instanced)

        //Fragment Shaders
        fragmentShaders.updateValue(Basic_FragmentShader(), forKey: .Basic)
        fragmentShaders.updateValue(Point_FragmentShader(), forKey: .Point)
    }
    
    public static func Vertex(_ vertexShaderType: VertexShaderTypes)->MTLFunction {
        return vertexShaders[vertexShaderType]!.function
    }
    
    public static func Fragment(_ fragmentShaderType: FragmentShaderTypes)->MTLFunction {
        return fragmentShaders[fragmentShaderType]!.function
    }
}

protocol Shader {
    var name: String { get }
    var functionName: String { get }
    var function: MTLFunction! { get }
}

public struct Basic_VertexShader: Shader {
    public var name: String = "Basic Vertex Shader"
    public var functionName: String = "basic_vertex_shader"
    public var function: MTLFunction!
    init() {
        function = ShaderLibrary.DefaultLibrary.makeFunction(name: functionName)
        function?.label = name
    }
}

public struct Point_VertexShader: Shader {
    public var name: String = "Point Vertex Shader"
    public var functionName: String = "point_vertex_shader"
    public var function: MTLFunction!
    init() {
        function = ShaderLibrary.DefaultLibrary.makeFunction(name: functionName)
        function?.label = name
    }
}

public struct Instanced_VertexShader: Shader {
    public var name: String = "Instanced Vertex Shader"
    public var functionName: String = "instanced_vertex_shader"
    public var function: MTLFunction!
    init() {
        function = ShaderLibrary.DefaultLibrary.makeFunction(name: functionName)
        function?.label = name
    }
}

public struct Basic_FragmentShader: Shader {
    public var name: String = "Basic Fragment Shader"
    public var functionName: String = "basic_fragment_shader"
    public var function: MTLFunction!
    init() {
        function = ShaderLibrary.DefaultLibrary.makeFunction(name: functionName)
        function?.label = name
    }
}

public struct Point_FragmentShader: Shader {
    public var name: String = "Point Fragment Shader"
    public var functionName: String = "point_fragment_shader"
    public var function: MTLFunction!
    init() {
        function = ShaderLibrary.DefaultLibrary.makeFunction(name: functionName)
        function?.label = name
    }
}
