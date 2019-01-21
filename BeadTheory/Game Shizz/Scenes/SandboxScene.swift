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
    var pointCollection: PointCollection!
    func addIcosohedrons() {
        icosohedronCollection = IcosohedronCollection(icosohedronsWide: 2, icosohedronsHigh: 2, icosohedronsBack: 2)
        addChild(icosohedronCollection)
        
        // TODO: Phase1 Starting point
//        pointCollection = PointCollection(pointsWide: 4, pointsHigh: 4)
//        addChild(pointCollection)
    }
    
    override func update(deltaTime: Float) {
//        cubeCollection.rotation.z += deltaTime
//        icosohedronCollection.rotation.z += deltaTime / 10.0
        
        super.update(deltaTime: deltaTime)
    }
}
