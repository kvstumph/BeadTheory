import MetalKit

class PointScene: Scene {
    
    var debugCamera = DebugCamera()
    
    override func buildScene() {
        addCamera(debugCamera)
        
        debugCamera.position.z = 30
        
        addPoints()
    }
    
    var pointCollection: PointCollection!
    func addPoints() {
        // TODO: Phase1 Starting point
        pointCollection = PointCollection(pointsWide: 4, pointsHigh: 4)
        addChild(pointCollection)
    }
    
    override func update(deltaTime: Float) {
//        cubeCollection.rotation.z += deltaTime
//        icosohedronCollection.rotation.z += deltaTime / 10.0
        
        super.update(deltaTime: deltaTime)
    }
}
