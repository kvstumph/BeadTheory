
#include <metal_stdlib>
using namespace metal;

struct VertexIn {
    float3 position [[ attribute(0) ]];
    float4 color [[ attribute(1) ]];
};

struct PointInOut {
    float4 position [[ position ]];
    float size [[ point_size ]];
};

struct RasterizerData {
    float4 position [[ position ]];
    float4 color;
};

struct ModelConstants {
    float4x4 modelMatrix;
};

struct SceneConstants {
    float4x4 viewMatrix;
    float4x4 projectionMatrix;
};

struct Material {
    float4 color;
    bool useMaterialColor;
};

vertex RasterizerData basic_vertex_shader(const VertexIn vIn [[ stage_in ]],
                                          constant SceneConstants &sceneConstants [[ buffer(1) ]],
                                          constant ModelConstants &modelConstants [[ buffer(2) ]]) {
    RasterizerData rd;
    rd.position = sceneConstants.projectionMatrix * sceneConstants.viewMatrix * modelConstants.modelMatrix * float4(vIn.position, 1);
    rd.color = vIn.color;
    return rd;
}

vertex RasterizerData instanced_vertex_shader(const VertexIn vIn [[ stage_in ]],
                                              constant SceneConstants &sceneConstants [[ buffer(1) ]],
                                              constant ModelConstants *modelConstants [[ buffer(2) ]],
                                              uint instanceId [[ instance_id ]]) {
    RasterizerData rd;
    
    ModelConstants modelConstant = modelConstants[instanceId];
    
    rd.position = sceneConstants.projectionMatrix * sceneConstants.viewMatrix * modelConstant.modelMatrix * float4(vIn.position, 1);
    rd.color = vIn.color;
    return rd;
}

fragment half4 basic_fragment_shader(RasterizerData rd [[ stage_in ]],
                                     constant Material &material [[ buffer(1) ]]) {
    float4 color = material.useMaterialColor ? material.color : rd.color;
    return half4(color.r, color.g, color.b, color.a);
}


//constant SceneConstants &sceneConstants [[ buffer(1) ]],
//constant ModelConstants *modelConstants [[ buffer(2) ]],
//uint instanceId [[ instance_id ]]) {

//vertex PointInOut point_vertex_shader(uint vid [[ vertex_id ]],
//                                     constant packed_float3* position [[ buffer(0) ]])
//{

vertex PointInOut point_vertex_shader(const VertexIn vIn [[ stage_in ]],
                                      constant ModelConstants *modelConstants [[ buffer(1) ]],
                                      uint instanceId [[ instance_id ]])
{
    PointInOut outVertex;
    
    ModelConstants modelConstant = modelConstants[instanceId];
    outVertex.position = modelConstant.modelMatrix * float4(vIn.position, 1);
    outVertex.size = 10.0;
    return outVertex;
};

fragment half4 point_fragment_shader(PointInOut inFrag [[ stage_in ]])
{
    return half4(.1, .5, .9, 1.);
};
