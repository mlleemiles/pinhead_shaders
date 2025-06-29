// Lens Halo PS
// ---- Created with 3Dmigoto v1.3.16 on Wed Sep 27 12:39:53 2023
Texture2D<float4> t0 : register(t0);

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
  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

    float2 uv = v2.xy;
    r0.xy = 1 - v2.zw * v2.zw * v2.zw * v2.zw;
    float weight3 = r0.x * r0.y;
    if ((r0.x > 0) == 0) {
        discard;
    }
   
    float weight = 2.f * length(uv) - 1.f;
    weight = 1.f - abs(weight);
    weight = max(0.f, weight);
    
    float weight2 = 3.f - 2.f * weight;
    weight = weight * weight * weight2;
    weight = min(weight, 1.f);
    weight = weight * weight * weight * weight3;

    float2 haloUV = normalize(v2.xy) * 0.414214 + v1.xy;
    float3 halo = t0.SampleLevel(s0_s, haloUV.xy, 0).xyz * weight * 0.1;
    o0 = halo;


/*
  r0.x = dot(-v1.zw, -v1.zw);
  r0.x = rsqrt(r0.x);
  r0.xy = -v1.zw * r0.xx;
  r0.xy = normalize(v2.xy) * float2(0.414214,0.414214) + v1.xy;
  r0.xy = float2(1,1) + -r0.xy;
  r0.xyz = t0.SampleLevel(s0_s, r0.xy, 0).xyz;
  float3 col = r0;
 
  r0.x = dot(float3(0.212500006,0.715399981,0.0720999986), r0.xyz);
  r0.x = sqrt(r0.x);
  r0.y = dot(v1.zw, v1.zw);
  r0.y = r0.y * r0.y;
  r0.yzw = r0.yyy + float3(-1,-1,-1);
  r0.yzw = -abs(r0.yzw) * abs(r0.yzw) + float3(1,1,1);
  r0.yzw = max(float3(0,0,0), r0.yzw);
  r0.yzw = r0.yzw * r0.yzw;
  r0.yzw = r0.yzw * r0.yzw;
  r0.yzw = r0.yzw * r0.yzw;
  o0.xyz = col * r0.yzw * 0.1;
*/
  return;
}