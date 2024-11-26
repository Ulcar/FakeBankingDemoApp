//
//  Color.metal
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 05/11/2024.
//

#include <metal_stdlib>
using namespace metal;



float oscillate(float f) {
    return 0.5 * (sin(f) + 1);
}


[[ stitchable ]]
half4 color(
    float2 position,
    half4 color
) {
    return half4(position.x / 255.0, position.y / 255.0, 0, 1.0);
}

[[ stitchable ]]
half4 sizeColor(
    float2 position,
    half4 color,
    float2 size,
    float time
) {
    float2 uv = float2(position.x / size.x + oscillate(time), position.y / size.y + oscillate(time));
    
    
    
    return half4(uv.x, uv.y, 0, 1.0);
}

[[ stitchable ]]
float4 Daltonize( float2 position, half4 color )
{
    return float4(color.r, color.g, color.b, 1);
}


[[ stitchable ]]
half4 sineWave(
               float2 position,
               half4 color,
               float2 size,
               float time,
               half4 gradientDarkColor,
               half4 gradientLightColor
               
) {
    float2 uv = float2(position.x / size.x, position.y / size.y);
    
    // vertical gradient
    
    half3 waveColor = half3(1,0,0);
    
    half3 outputColor = mix(gradientDarkColor.rgb, gradientLightColor.rgb, uv.y);

    float frequency = 0.02;
    float amplitude = 0.04;
    float speed = 100;
    half angle = time * speed * frequency + uv.x;
    float y = (sin(angle) * amplitude) + 0.5;
    
    float distanceY = distance(float2(y,y), float2(uv.y,uv.y));

    float step = smoothstep(0.9, 0, distanceY);
    step = pow(step, 15.0);
    half3 output = min(waveColor * step, waveColor);
    output = min(output, outputColor);
    output += outputColor;
    
    return half4(output, 1.0);
}






float map(float value, float min1, float max1, float min2, float max2) {
  return min2 + (value - min1) * (max2 - min2) / (max1 - min1);
}



