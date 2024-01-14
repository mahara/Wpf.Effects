namespace Wpf.Effects
{
    using System.Windows;
    using System.Windows.Media;
    using System.Windows.Media.Effects;

    /// <summary>
    ///     Grayscale effect.
    /// </summary>
    /// <remarks>
    ///     AUTHORS:
    ///     -   Anders Bursjöö
    ///     REFERENCES:
    ///     -   <see href="https://bursjootech.blogspot.com/2008/06/grayscale-effect-pixel-shader-effect-in.html">Grayscale Effect - A Pixel Shader Effect in WPF</see>
    /// </remarks>
    public class GrayscaleEffect : ShaderEffect
    {
        private static readonly Type ThisType = typeof(GrayscaleEffect);

        private static readonly PixelShader Shader = new()
        {
            UriSource = EffectHelper.GetPackUri(EffectHelper.GetEffectPixelShaderFileRelativePath(nameof(GrayscaleEffect))),
        };

        public static readonly DependencyProperty InputProperty =
            RegisterPixelShaderSamplerProperty(
                nameof(Input),
                ThisType,
                0);

        public static readonly DependencyProperty DesaturationFactorProperty =
            DependencyProperty.Register(
                nameof(DesaturationFactor),
                typeof(double),
                ThisType,
                new FrameworkPropertyMetadata(0.0,
                                              PixelShaderConstantCallback(0),
                                              CoerceDesaturationFactor));

        public GrayscaleEffect()
        {
            PixelShader = Shader;

            UpdateShaderValue(InputProperty);
            UpdateShaderValue(DesaturationFactorProperty);
        }

        public Brush Input
        {
            get => (Brush) GetValue(InputProperty);
            set => SetValue(InputProperty, value);
        }

        public double DesaturationFactor
        {
            get => (double) GetValue(DesaturationFactorProperty);
            set => SetValue(DesaturationFactorProperty, value);
        }

        private static object CoerceDesaturationFactor(DependencyObject d, object value)
        {
            var effect = (GrayscaleEffect) d;
            var factor = (double) value;

            if (factor is < 0.0 or > 1.0)
            {
                return effect.DesaturationFactor;
            }

            return factor;
        }
    }
}
