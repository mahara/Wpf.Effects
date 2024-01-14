namespace Wpf.Effects
{
    internal class EffectHelper
    {
        private static readonly string AssemblyName;

        static EffectHelper()
        {
            var assembly = typeof(EffectHelper).Assembly;
            AssemblyName = assembly.GetName().Name!;
        }

        internal static Uri GetPackUri(string relativeFilePath)
        {
            var uriString = $@"pack://application:,,,/{AssemblyName};component/{relativeFilePath}";
            return new Uri(uriString);
        }

        internal static string GetEffectPixelShaderFileRelativePath(string effectName)
        {
            return $"{effectName}/{effectName}.ps";
        }
    }
}
