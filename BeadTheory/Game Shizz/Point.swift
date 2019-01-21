import MetalKit

// Just like a Node but with no need for rotation or scale
// TODO: Consider having Node inherit from Point
class Point {
    
    var position: float3 = float3(0)
    var momentum: float3 = float3(Float.random(in: -1.0..<1.0), Float.random(in: -1.0..<1.0), Float.random(in: -1.0..<1.0))
    
    var modelMatrix: matrix_float4x4 {
        var modelMatrix = matrix_identity_float4x4
        
        modelMatrix.translate(direction: position)
        
        return modelMatrix
    }
    
    var children: [Point] = []
    
    func addChild(_ child: Point) {
        children.append(child)
    }
    
    func update(deltaTime: Float) {
        for child in children {
            child.update(deltaTime: deltaTime)
        }
    }
    
    func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        for child in children {
            child.render(renderCommandEncoder: renderCommandEncoder)
        }
        
        if let renderable = self as? Renderable {
            renderable.doRender(renderCommandEncoder)
        }
    }
}

