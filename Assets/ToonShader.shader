Shader "Custom/ToonShader"
{
    Properties
    {
        //the original colours aswell as the ramptextures reference
        _Color ("Color", Color) = (1,1,1,1)
        _RampTex ("Ramp Text", 2D) = "white" {}
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf ToonRamp

        float4 _Color;
        sampler2D _RampTex;

        //rounds light to fit toonmap
        float4 LightingToonRamp (SurfaceOutput s, fixed3 lightDir, fixed atten)
        {
            float diff = dot (s.Normal, lightDir);
            float h = diff * 0.5 + 0.5;
            float2 rh = h;
            float3 ramp = tex2D(_RampTex, rh).rgb;

            float4 c;
            c.rgb = s.Albedo * _LightColor0.rgb * (ramp);
            c.a = s.Alpha;
            return c;
        }

        //inputs uvs
        struct Input
        {
            float2 uv_MainTex;
        };

        //applies solid colours
        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
