import MetalKit

class PointCollection: InstancedPointObject {
    var pointsWide: Int = 0
    var pointsHigh: Int = 0
    
    init(pointsWide: Int, pointsHigh: Int) {
        super.init(meshType: .Point_Custom, instanceCount: pointsWide * pointsHigh)
//        super.init(meshType: .Cube_Custom, instanceCount: icosohedronsWide * icosohedronsHigh * icosohedronsBack)
        self.pointsWide = pointsWide
        self.pointsHigh = pointsHigh
        
        print("POINT COUNT: \(pointsWide * pointsHigh)")
        
//        setColor(ColorUtil.randomColor)
    }
    
    var time: Float = 0.0
    var modTime: Float = 0.0
    override func update(deltaTime: Float) {
        time += deltaTime
        
        let halfWide: Float = Float(pointsWide / 2)
        let halfHigh: Float = Float(pointsHigh / 2)

        var index: Int = 0
        let gap: Float = 4 // cos(time / 2) * 10
        
        let fullWidth = (halfWide * 2 - 1) * gap
        
        modTime = time
        while (modTime > fullWidth) {
            modTime -= fullWidth
        }
        
        for y in stride(from: -halfHigh, to: halfHigh, by: 1.0) {
            let posY = Float(y * gap)
            for x in stride(from: -halfWide, to: halfWide, by: 1.0) {
                let posX = Float(x * gap)
//                for z in stride(from: -halfBack, to: halfBack, by: 1.0) {
//                    let posZ = Float(z * gap)
                    _points[index].position.y = posY
                    _points[index].position.x = posX
//                      _nodes[index].position.y = posY
//                      _nodes[index].position.y = posX
//                    _nodes[index].position.z = posZ
//                    _points[index].position.x = posX + modTime * _points[index].momentum.x
//                    _points[index].position.y = posY + modTime * _points[index].momentum.y
//                    _nodes[index].position.z = posZ + modTime * _nodes[index].momentum.z
//                    _nodes[index].rotation.z -= deltaTime * 2
//                    _nodes[index].rotation.y -= deltaTime * 2
//                    _nodes[index].scale = float3(0.3)
                    index += 1
//                }
            }
        }
        super.update(deltaTime: deltaTime)
    }
}
