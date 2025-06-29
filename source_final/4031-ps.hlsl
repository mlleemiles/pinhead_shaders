// Glow Streak Apply
// ---- Created with 3Dmigoto v1.3.16 on Wed Sep 27 12:17:17 2023
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);




// 3Dmigoto declarations
#define cmp -
Texture1D<float4> IniParams : register(t120);
Texture2D<float4> StereoParams : register(t125);


void main(
  float4 v0 : SV_POSITION0,
  linear noperspective float4 v1 : TEXCOORD0,
  out float3 o0 : SV_TARGET0)
{
  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = t0.SampleLevel(s0_s, v1.xw, 0).x;
  o0.x = r0.x;
  r0.x = t0.SampleLevel(s0_s, v1.yw, 0).y;
  o0.y = r0.x;
  r0.x = t0.SampleLevel(s0_s, v1.zw, 0).z;
  o0.z = r0.x;

  o0.xyz *= 0.333f;

  return;
}