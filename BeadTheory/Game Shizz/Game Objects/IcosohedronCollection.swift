import MetalKit

class IcosohedronCollection: InstancedGameObject {
    var icosohedronsWide: Int = 0
    var icosohedronsHigh: Int = 0
    var icosohedronsBack: Int = 0
    
    init(icosohedronsWide: Int, icosohedronsHigh: Int, icosohedronsBack: Int) {
        super.init(meshType: .Icosohedron_Custom, instanceCount: icosohedronsWide * icosohedronsHigh * icosohedronsBack)
//        super.init(meshType: .Cube_Custom, instanceCount: icosohedronsWide * icosohedronsHigh * icosohedronsBack)
        self.icosohedronsWide = icosohedronsWide
        self.icosohedronsHigh = icosohedronsHigh
        self.icosohedronsBack = icosohedronsBack
        
        print("ICOSOHEDRON COUNT: \(icosohedronsWide * icosohedronsHigh * icosohedronsBack)")
        
//        setColor(ColorUtil.randomColor)
    }
    
    var time: Float = 0.0
    var modTime: Float = 0.0
    override func update(deltaTime: Float) {
        time += deltaTime
        
        let halfWide: Float = Float(icosohedronsWide / 2)
        let halfHigh: Float = Float(icosohedronsHigh / 2)
        let halfBack: Float = Float(icosohedronsBack / 2)

        var index: Int = 0
        let gap: Float = 5 // cos(time / 2) * 10
        
        let fullWidth = (halfWide * 2 - 1) * gap
        
        modTime = time
        while (modTime > fullWidth) {
            modTime -= fullWidth
        }
        
        for y in stride(from: -halfHigh, to: halfHigh, by: 1.0) {
            let posY = Float(y * gap)
            for x in stride(from: -halfWide, to: halfWide, by: 1.0) {
                let posX = Float(x * gap)
                for z in stride(from: -halfBack, to: halfBack, by: 1.0) {
                    let posZ = Float(z * gap)
//                    _nodes[index].position.y = posY
//                    _nodes[index].position.x = posX
//                    _nodes[index].position.z = posZ
                    _nodes[index].position.x = posX + modTime * _nodes[index].momentum.x
                    _nodes[index].position.y = posY + modTime * _nodes[index].momentum.y
                    _nodes[index].position.z = posZ + modTime * _nodes[index].momentum.z
                    _nodes[index].rotation.z -= deltaTime * 2
                    _nodes[index].rotation.y -= deltaTime * 2
                    _nodes[index].scale = float3(0.3)
                    index += 1
                }
            }
        }
        super.update(deltaTime: deltaTime)
    }
}
