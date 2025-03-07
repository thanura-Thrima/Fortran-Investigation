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

    public class Sort
    {
        [DllImport("Geomlib.dll", CallingConvention = CallingConvention.Cdecl, EntryPoint = "BUBBLE_SORT")]
        public static extern void BUBBLE_SORT([In, Out] double[] array, ref int count);

        [DllImport("Geomlib.dll", CallingConvention = CallingConvention.Cdecl, EntryPoint = "QUICK_SORT")]
        public static extern void QUICK_SORT([In, Out] double[] array, ref int count);
    }
}