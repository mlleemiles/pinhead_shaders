// Fog 2D PS
// ---- Created with 3Dmigoto v1.3.16 on Wed Sep 27 12:37:42 2023
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
  linear noperspective float2 v1 : TEXCOORD0,
  out float3 o0 : SV_TARGET0)
{
  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r1.xyz = t1.SampleLevel(s0_s, v1.xy, 0).xyz;  //Current
  //const float radius_prev[6] = {0, 1, 1, 1, 1, 0};
  //const float radius_cur[6] = {0, 0, 1, 1, 1, 0.675 * 0.4};
  o0.xyz = r1.xyz * 0.675 * 0.415;
  //o0.xyz = r0.xyz + r1.xyz * 0.15;//0.0755;
/*
  r0.x = dot(v1.xy, v1.xy);
  r0.y = rsqrt(r0.x);
  r0.x = sqrt(r0.x);
  r0.x = max(0.0149999997, r0.x);
  r0.x = min(1, r0.x);
  r0.x = log2(r0.x);
  r0.x = 0.330000013 * r0.x;
  r0.x = exp2(r0.x);
  r0.yz = v1.xy * r0.yy;
  r0.z = r0.z / r0.y;
  r0.y = cmp(0 < r0.y);
  r0.w = max(1, abs(r0.z));
  r0.w = 1 / r0.w;
  r1.x = min(1, abs(r0.z));
  r0.w = r1.x * r0.w;
  r1.x = r0.w * r0.w;
  r1.y = r1.x * 0.0208350997 + -0.0851330012;
  r1.y = r1.x * r1.y + 0.180141002;
  r1.y = r1.x * r1.y + -0.330299497;
  r1.x = r1.x * r1.y + 0.999866009;
  r1.y = r1.x * r0.w;
  r1.y = r1.y * -2 + 1.57079637;
  r1.z = cmp(1 < abs(r0.z));
  r0.z = min(1, r0.z);
  r0.z = cmp(r0.z < -r0.z);
  r1.y = r1.z ? r1.y : 0;
  r0.w = r0.w * r1.x + r1.y;
  r0.z = r0.z ? -r0.w : r0.w;
  r0.zw = r0.zz * float2(0.159154937,0.159154937) + float2(0.25,0.75);
  r1.x = r0.y ? r0.w : r0.z;
  r1.y = 1;
  r0.yzw = t0.SampleLevel(s0_s, r1.xy, 0).xyz;
  r1.xyz = t1.SampleLevel(s1_s, float2(0.5,0.5), 0).xyz;
  r0.yzw = -r1.xyz + r0.yzw;
  r1.w = r0.x * -2 + 3;
  r0.x = r0.x * r0.x;
  r0.x = r1.w * r0.x;
  o0.xyz = r0.xxx * r0.yzw + r1.xyz;
*/
  return;
}