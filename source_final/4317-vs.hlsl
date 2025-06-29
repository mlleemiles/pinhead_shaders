// Lens Flare VS
// ---- Created with 3Dmigoto v1.3.16 on Wed Sep 27 12:17:38 2023
cbuffer cb1 : register(b1)
{
  float4 cb1[1];
}

cbuffer cb3 : register(b3)
{
  float4 cb3[3];
}




// 3Dmigoto declarations
#define cmp -
Texture1D<float4> IniParams : register(t120);
Texture2D<float4> StereoParams : register(t125);


void main(
  float4 v0 : POSITION0,
  uint v1 : SV_VERTEXID0,
  uint v2 : SV_INSTANCEID0,
  out float4 o0 : SV_POSITION0,
  out float2 o1 : TEXCOORD0)
{
  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  float4 flare = IniParams.Load(int2(2, 0));
    //const float v_pos[8] = { 0.5, -0.4, -0.7, -1.0, -1.1, -4.5, -6.5, -9.0 };
    //const float v_pos[8] = { 0.5, -0.4, -0.7, -1.0, -1.1, -4.5, -6.5, -9.0 };
  r0.xy = cmp(float2(0,0) < v0.xy);
  r0.xy = r0.xy ? float2(3,1) : float2(-1,-3);

  o0.xy = cb1[0].ww * r0.xy;
  o0.z = 0;//dot(v0.xyzw, cb3[2].xyzw);
  o0.w = 1;
  r0.xy = cmp(float2(0,0) < v0.xy);
  o1.xy = r0.xy ? float2(2,0) : float2(0,2);
  return;
}