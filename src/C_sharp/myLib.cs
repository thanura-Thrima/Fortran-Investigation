using System;
using System.Runtime.InteropServices;

namespace FortranInterface
{
    public class Math
    {
        [DllImport("Geomlib.dll", CallingConvention = CallingConvention.Cdecl)]
        public static extern void ADD(ref double a, ref double b, out double result);

        [DllImport("Geomlib.dll", CallingConvention = CallingConvention.Cdecl)]
        public static extern void SUBSTRACT(ref double a, ref double b, out double result);
    }
}