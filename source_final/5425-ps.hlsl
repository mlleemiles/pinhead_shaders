// Tonemapping
// ---- Created with 3Dmigoto v1.3.16 on Wed Sep 27 12:18:53 2023
Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0)
{
  float4 cb0[1];
}




// 3Dmigoto declarations
#define cmp -
Texture1D<float4> IniParams : register(t120);
Texture2D<float4> StereoParams : register(t125);


void main(
  float4 v0 : SV_POSITION0,
  linear noperspective float2 v1 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = t1.SampleLevel(s0_s, float2(0,0), 0).x;
  r1.xyzw = t0.SampleLevel(s0_s, v1.xy, 0).xyzw;
  r0.xyz = r1.xyz * r0.xxx;
  o0.w = r1.w;
  r0.w = dot(float3(0.212500006,0.715399981,0.0720999986), r0.xyz);
  r1.xy = r0.ww * cb0[0].xy + cb0[0].zw;
  r0.w = r1.x / r1.y;
  o0.xyz = r0.xyz * r0.www;
  return;
}