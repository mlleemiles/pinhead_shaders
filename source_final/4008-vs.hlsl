// ---- Created with 3Dmigoto v1.3.16 on Wed Sep 27 12:17:16 2023
cbuffer cb3 : register(b3)
{
  float4 cb3[3];
}

cbuffer cb2 : register(b2)
{
  float4 cb2[15];
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
  out float4 o1 : TEXCOORD0,
  out float2 o2 : TEXCOORD1)
{
  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  o0.z = dot(v0.xyzw, cb3[2].xyzw);
  o0.w = 1;
  r0.x = dot(v0.xyzw, cb3[0].xyzw);
  r0.y = dot(v0.xyzw, cb3[1].xyzw);
  o0.xy = r0.xy;
  r0.xy = r0.xy * float2(0.5,-0.5) + float2(0.5,0.5);
  r0.xy = cb2[14].zw * r0.xy;
  r0.xy = r0.xy * cb2[9].xy + cb2[9].zw;
  r0.z = -1;
  o1.x = dot(r0.xyz, cb2[10].xyz);
  o1.y = dot(r0.xyz, cb2[11].xyz);
  o1.z = dot(r0.xyz, cb2[12].xyz);
  r0.xy = cmp(float2(0,0) < v0.xy);
  o2.xy = r0.xy ? float2(2,0) : float2(0,2);
  return;
}

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~ HLSL errors ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
D:\Dying Light 2\ph\work\bin\x64\ShaderCache\c7a2632c9d1c29a0-vs_replace.txt(26,14-15): warning X3578: Output value 'o1' is not completely initialized
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
