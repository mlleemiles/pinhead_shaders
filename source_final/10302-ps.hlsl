// indirect_specular_apply
// ---- Created with 3Dmigoto v1.3.16 on Wed Sep 27 12:34:37 2023
Texture2D<float4> t7 : register(t7);

Texture2D<float4> t6 : register(t6);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0)
{
  float4 cb0[2];
}




// 3Dmigoto declarations
#define cmp -
Texture1D<float4> IniParams : register(t120);
Texture2D<float4> StereoParams : register(t125);

#define NEAR_TO_FAR 64

void main(
  float4 v0 : SV_POSITION0,
  linear noperspective float4 v1 : TEXCOORD0,
  linear noperspective float2 v2 : TEXCOORD1,
  out float3 o0 : SV_TARGET0)
{
  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = (uint2)v0.xy;
  r0.zw = float2(0,0);
  r1.x = t6.Load(r0.xyw).x;
  r1.yzw = t7.Load(r0.xyw).xyz;
  r1.yzw = r1.yzw * float3(2,2,2) + float3(-1,-1,-1);
  
  r2.x = dot(r1.yzw, r1.yzw);
  r2.x = rsqrt(r2.x);
  r2.yzw = r2.xxx * r1.yzw;
  
  
  float3 normal = (r2.ywz);
  r3.x = dot(v1.xyz, v1.xyz);
  r3.x = rsqrt(r3.x);
  r3.xyz = v1.xyz * r3.xxx;
  r3.w = t5.Load(r0.xyw).z;
  
  float roughness = r3.w;
  
  r4.x = sqrt(r3.w);
  r4.x = r4.x * 9 + -cb0[1].z;
  
  r4.y = saturate(1 + -r3.w);
  
  r4.z = sqrt(r4.y);
  r3.w = r4.z + r3.w;
  r3.w = saturate(r4.y * r3.w);
  
  
  r4.y = dot(r3.xyz, r2.yzw);
  r4.y = r4.y + r4.y;
  r3.xyz = r2.yzw * -r4.yyy + r3.xyz;
  r1.yzw = -r1.yzw * r2.xxx + r3.xyz;
  r1.yzw = r3.www * r1.yzw + r2.yzw;
  r2.x = dot(r1.yzw, r1.yzw);
  r2.x = rsqrt(r2.x);
  r1.yzw = r2.xxx * r1.yzw;

  
  
  r1.x = smoothstep(72, 128, r1.x);//saturate(r1.x/NEAR_TO_FAR);
  
  r2.x = exp2(r4.x);
  r2.y = dot(float3(1,1,1), abs(r1.yzw));
  r1.yzw = r1.yzw / r2.yyy;
  r2.yz = float2(1,1) + -abs(r1.wy);
  r3.xy = cmp(r1.yw < float2(0,0));
  r2.yz = r3.xy ? -r2.yz : r2.yz;
  r1.z = cmp(0 >= r1.z);
  r1.yz = r1.zz ? r2.yz : r1.yw;
  r2.yz = abs(r1.zy) * float2(2,2) + float2(-1,-1);
  r2.yz = float2(1,1) + -abs(r2.yz);
  r2.yz = float2(512,512) * abs(r2.yz);
  r2.yz = r2.yz / r2.xx;
  r2.yz = min(float2(1,1), r2.yz);
  r2.yz = float2(1,1) + -r2.yz;
  r3.xyzw = cmp(r1.yzyz < float4(0,0,0,0));
  r3.xyzw = r3.xyzw ? float4(0.000976999989,0.000976999989,-0.000976999989,-0.000976999989) : float4(-0.000976999989,-0.000976999989,0.000976999989,0.000976999989);
  r5.xyzw = abs(r1.yzyz) * float4(1.17806256,1.17806256,-1.17806256,-1.17806256) + float4(0,0,1.17806256,1.17806256);
  r3.xyzw = r5.xyzw * r3.xyzw;
  r4.yz = cmp(float2(0.5,0.5) < abs(r1.zy));
  r3.xy = r4.yz ? r3.zw : r3.xy;
  r2.xw = r3.xy * r2.xx;
  r1.yz = r2.xw * r2.yz + r1.yz;
  r1.yz = r1.yz * float2(0.449999988,0.449999988) + float2(0.5,0.5);
  
  r1.w = cmp(r1.x < 1);
  if (r1.w != 0) {
    r2.xyz = t0.SampleLevel(s0_s, r1.yz, r4.x).xyz; //far
    r3.xyz = t1.SampleLevel(s0_s, r1.yz, r4.x).xyz; //near
    //r1.x = r1.x * r1.x;
    r2.xyz = -r3.xyz + r2.xyz;
    r2.xyz = r1.xxx * r2.xyz + r3.xyz;
  } else {
    r2.xyz = t0.SampleLevel(s0_s, r1.yz, r4.x).xyz;
  }
  
  /*
  r2.xyz = t0.SampleLevel(s0_s, r1.yz, r4.x).xyz; //far
  r3.xyz = t1.SampleLevel(s0_s, r1.yz, r4.x).xyz; //near

  
  r2.xyz = r2;//(luminance.x < luminance.y) ? r2 : r3;// the reflection is so low quality that you wont even see its messed up
  */
  r1.x = t4.Load(r0.xyw).x;
  
  float ambient_occlusion = r1.x;
  
  r1.xyz = r2.xyz * r1.xxx * r1.xxx;
  r2.xy = v2.xy * float2(2,2) + float2(-1,-1);
  r3.xyz = float3(1,1,1) + -abs(r2.xyx);
  r4.y = r3.x + -abs(r2.y);
  r2.zw = cmp(r2.xy < float2(0,0));
  r2.zw = r2.zw ? -r3.yz : r3.yz;
  r1.w = cmp(0 >= r4.y);
  r4.xz = r1.ww ? r2.zw : r2.xy;
  r1.w = dot(r4.xyz, r4.xyz);
  r1.w = rsqrt(r1.w);
  r2.xyz = normal.xzy;//r4.xyz * r1.www;
  
  
  
  r1.w = dot(float3(1,1,1), abs(r2.xyz));
  r2.xyz = r2.xyz / r1.www;
  r3.xy = float2(1,1) + -abs(r2.zx);
  r3.zw = cmp(r2.xz < float2(0,0));
  r3.xy = r3.zw ? -r3.xy : r3.xy;
  r1.w = cmp(0 >= r2.y);
  r2.xy = r1.ww ? r3.xy : r2.xz;
  r2.zw = abs(r2.yx) * float2(2,2) + float2(-1,-1);
  r2.zw = float2(1,1) + -abs(r2.zw);
  r2.zw = saturate(cb0[1].yx * abs(r2.zw));
  r2.zw = float2(1,1) + -r2.zw;
  r3.xyzw = cmp(r2.xyxy < float4(0,0,0,0));
  r3.xyzw = r3.xyzw ? cb0[0].xyzw : cb0[0].zwxy;
  r4.xyzw = abs(r2.xyxy) * float4(1.17806256,1.17806256,-1.17806256,-1.17806256) + float4(0,0,1.17806256,1.17806256);
  r3.xyzw = r4.xyzw * r3.xyzw;
  r4.xy = cmp(float2(0.5,0.5) < abs(r2.yx));
  r3.xy = r4.xy ? r3.zw : r3.xy;
  r2.xy = r3.xy * r2.zw + r2.xy;
  r2.xy = r2.xy * float2(0.25,0.25) + float2(0.5,0.5);
  r2.xyz = t3.SampleLevel(s1_s, r2.xy, 0).xyz;
  r1.w = dot(float3(0.333299994,0.333299994,0.333299994), r2.xyz);
  r0.xyz = t2.Load(r0.xyz).xyz;
  
  float ambient_brightness;
  
  ambient_brightness = r0.x = dot(float3(0.333299994,0.333299994,0.333299994), r0.xyz);
  r0.x = saturate(r0.x / r1.w);
  

  float intensity = 1;//max(roughness, r0.x);
  float upward_intensity = lerp( 0.12, 0.24, abs(normal.z) );
  intensity = lerp( r0.x, intensity, smoothstep(0.0, upward_intensity, r0.x) );
  
  
  r0.xyz = r1.xyz * intensity;
  r1.xyz = (int3)r0.xyz & int3(0x7f800000,0x7f800000,0x7f800000);
  r1.w = 1;
  r1.xyzw = cmp((int4)r1.xyzw == int4(0x7f800000,0x7f800000,0x7f800000,0x7f800000));
  r1.xy = (int2)r1.zw | (int2)r1.xy;
  r0.w = (int)r1.y | (int)r1.x;
  o0.xyz = r0.www ? float3(0,0,0) : r0.xyz;
  return;
}