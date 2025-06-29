// glow_lens_flares_add.mat
// ---- Created with 3Dmigoto v1.3.16 on Wed Sep 27 12:42:26 2023
Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);




// 3Dmigoto declarations
#define cmp -
Texture1D<float4> IniParams : register(t120);
Texture2D<float4> StereoParams : register(t125);


void main(
  float4 v0 : SV_POSITION0,
  linear noperspective float4 v1 : TEXCOORD0,
  linear noperspective float4 v2 : TEXCOORD1,
  out float3 o0 : SV_TARGET0)
{
  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.w = length(v2.xy);
  float fade1 = smoothstep(0.2, 1.0, r0.w);
  float fade2 = smoothstep(1.05, 0.15, r0.w);
  float fade = fade1 * fade2;
  float intensity = 1.0 - r0.w * 0.7;

  r0.x = t2.SampleLevel(s1_s, v1.zw, 0).x * fade * 0.075 + fade * intensity * 0.03;
  r0.yzw = t0.Sample(s0_s, v1.xy).xyz;
  //r0.xyz = r0.yzw// * r0.x;
  r1.xyz = t1.Sample(s0_s, v1.xy).xyz;
  o0.xyz = (r0.yzw + r1.xyz)*r0.x * 1;
  

  
  
  
  //o0.xyz *= r0.x * r0.w;
  
  return;
}