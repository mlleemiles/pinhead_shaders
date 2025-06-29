// glow_lens_flares_source
// ---- Created with 3Dmigoto v1.3.16 on Wed Sep 27 12:23:27 2023
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);




// 3Dmigoto declarations
#define cmp -
Texture1D<float4> IniParams : register(t120);
Texture2D<float4> StereoParams : register(t125);


void main(
  float4 v0 : SV_POSITION0,
  linear noperspective float4 v1 : TEXCOORD0,
  linear noperspective float2 v2 : TEXCOORD1,
  out float3 o0 : SV_TARGET0)
{
  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;


  r0.xyz = t0.Sample(s0_s, v1.zy).xyz;
  r0.xyz = float3(0.25,0.25,0.25) * r0.xyz;
  r1.xyz = t0.Sample(s0_s, v1.xy).xyz;
  r0.xyz = r1.xyz * float3(0.25,0.25,0.25) + r0.xyz;
  r1.xyz = t0.Sample(s0_s, v1.xw).xyz;
  r0.xyz = r1.xyz * float3(0.25,0.25,0.25) + r0.xyz;
  r1.xyz = t0.Sample(s0_s, v1.zw).xyz;
  r0.xyz = r1.xyz * float3(0.25,0.25,0.25) + r0.xyz;
  
  
  r0.xyz = max(r0.xyz * 2.f - 2.f, 0.0);
  
  
  r0.w = dot(v2.xy, v2.xy);
  r0.w = min(1, r0.w);
  r0.w = 1 + -r0.w;
  r0.w = r0.w * r0.w;
  o0.xyz = r0.xyz * r0.www;
  
  return;
}