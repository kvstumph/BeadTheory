import MetalKit

class SandboxScene: Scene {
    
    var debugCamera = DebugCamera()
    
    override func buildScene() {
        addCamera(debugCamera)
        
        debugCamera.position.z = 30
        
//        addCubes()
        addIcosohedrons()
    }
    
    var cubeCollection: CubeCollection!
    func addCubes() {
        cubeCollection = CubeCollection(cubesWide: 20, cubesHigh: 20, cubesBack: 20)
        addChild(cubeCollection)
    }
    
    var icosohedronCollection: IcosohedronCollection!
    func addIcosohedrons() {
        icosohedronCollection = IcosohedronCollection(icosohedronsWide: 4, icosohedronsHigh: 4, icosohedronsBack: 4)
        addChild(icosohedronCollection)
    }
    
    override func update(deltaTime: Float) {
//        cubeCollection.rotation.z += deltaTime
//        icosohedronCollection.rotation.z += deltaTime / 10.0
        
        super.update(deltaTime: deltaTime)
    }
}
