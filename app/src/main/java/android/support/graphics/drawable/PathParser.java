package android.support.graphics.drawable;

import android.graphics.Path;
import android.util.Log;
import java.util.ArrayList;

class PathParser {
    private static final String LOGTAG = "PathParser";

    private static class ExtractFloatResult {
        int mEndPosition;
        boolean mEndWithNegOrDot;

        ExtractFloatResult() {
        }
    }

    public static class PathDataNode {
        float[] params;
        char type;

        PathDataNode(char c, float[] fArr) {
            this.type = (char) c;
            this.params = fArr;
        }

        PathDataNode(PathDataNode pathDataNode) {
            this.type = (char) pathDataNode.type;
            this.params = PathParser.copyOfRange(pathDataNode.params, 0, pathDataNode.params.length);
        }

        private static void addCommand(Path path, float[] fArr, char c, char c2, float[] fArr2) {
            int i;
            float f;
            int i2;
            float f2;
            float f3;
            int i3;
            float f4;
            float f5;
            float f6;
            float f7;
            float f8 = fArr[0];
            int i4 = fArr[1];
            float f9 = fArr[2];
            int i5 = fArr[3];
            float f10 = fArr[4];
            int i6 = fArr[5];
            switch (c2) {
                case 'A':
                case 'a':
                    i = 7;
                    break;
                case 'C':
                case 'c':
                    i = 6;
                    break;
                case 'H':
                case 'V':
                case 'h':
                case 'v':
                    i = 1;
                    break;
                case 'L':
                case 'M':
                case 'T':
                case 'l':
                case 'm':
                case 't':
                    i = 2;
                    break;
                case 'Q':
                case 'S':
                case 'q':
                case 's':
                    i = 4;
                    break;
                case 'Z':
                case 'z':
                    path.close();
                    path.moveTo(f10, i6);
                    i5 = i6;
                    f9 = f10;
                    i4 = i6;
                    f8 = f10;
                    i = 2;
                    break;
                default:
                    i = 2;
                    break;
            }
            int i7 = 0;
            int i8 = i6;
            while (true) {
                float f11 = f10;
                int i9 = i2;
                float f12 = f;
                int i10 = i7;
                if (i10 < fArr2.length) {
                    switch (c2) {
                        case 'A':
                            drawArc(path, f12, i9, fArr2[i10 + 5], fArr2[i10 + 6], fArr2[i10 + 0], fArr2[i10 + 1], fArr2[i10 + 2], fArr2[i10 + 3] != 0.0f, fArr2[i10 + 4] != 0.0f);
                            float f13 = fArr2[i10 + 5];
                            int i11 = fArr2[i10 + 6];
                            f10 = f11;
                            f3 = i11;
                            i3 = i8;
                            f2 = f13;
                            i2 = i11;
                            f = f13;
                            break;
                        case 'C':
                            path.cubicTo(fArr2[i10 + 0], fArr2[i10 + 1], fArr2[i10 + 2], fArr2[i10 + 3], fArr2[i10 + 4], fArr2[i10 + 5]);
                            float f14 = fArr2[i10 + 4];
                            float f15 = fArr2[i10 + 5];
                            f2 = fArr2[i10 + 2];
                            f3 = fArr2[i10 + 3];
                            f10 = f11;
                            i3 = i8;
                            i2 = f15;
                            f = f14;
                            break;
                        case 'H':
                            path.lineTo(fArr2[i10 + 0], i9);
                            f10 = f11;
                            i3 = i8;
                            i2 = i9;
                            f = fArr2[i10 + 0];
                            break;
                        case 'L':
                            path.lineTo(fArr2[i10 + 0], fArr2[i10 + 1]);
                            float f16 = fArr2[i10 + 0];
                            f10 = f11;
                            i3 = i8;
                            i2 = fArr2[i10 + 1];
                            f = f16;
                            break;
                        case 'M':
                            float f17 = fArr2[i10 + 0];
                            int i12 = fArr2[i10 + 1];
                            if (i10 <= 0) {
                                path.moveTo(fArr2[i10 + 0], fArr2[i10 + 1]);
                                f10 = f17;
                                i3 = i12;
                                i2 = i12;
                                f = f17;
                                break;
                            } else {
                                path.lineTo(fArr2[i10 + 0], fArr2[i10 + 1]);
                                f10 = f11;
                                i3 = i8;
                                i2 = i12;
                                f = f17;
                                break;
                            }
                        case 'Q':
                            path.quadTo(fArr2[i10 + 0], fArr2[i10 + 1], fArr2[i10 + 2], fArr2[i10 + 3]);
                            f2 = fArr2[i10 + 0];
                            f3 = fArr2[i10 + 1];
                            float f18 = fArr2[i10 + 2];
                            f10 = f11;
                            i3 = i8;
                            i2 = fArr2[i10 + 3];
                            f = f18;
                            break;
                        case 'S':
                            if (c == 'c' || c == 's' || c == 'C' || c == 'S') {
                                f6 = (2.0f * f12) - f2;
                                f5 = (1073741824 * i9) - f3;
                            } else {
                                f5 = i9;
                                f6 = f12;
                            }
                            path.cubicTo(f6, f5, fArr2[i10 + 0], fArr2[i10 + 1], fArr2[i10 + 2], fArr2[i10 + 3]);
                            f2 = fArr2[i10 + 0];
                            f3 = fArr2[i10 + 1];
                            float f19 = fArr2[i10 + 2];
                            f10 = f11;
                            i3 = i8;
                            i2 = fArr2[i10 + 3];
                            f = f19;
                            break;
                        case 'T':
                            if (c == 'q' || c == 't' || c == 'Q' || c == 'T') {
                                f2 = (2.0f * f12) - f2;
                                f3 = (1073741824 * i9) - f3;
                            } else {
                                f2 = f12;
                                f3 = i9;
                            }
                            path.quadTo(f2, f3, fArr2[i10 + 0], fArr2[i10 + 1]);
                            float f20 = fArr2[i10 + 0];
                            f10 = f11;
                            i3 = i8;
                            i2 = fArr2[i10 + 1];
                            f = f20;
                            break;
                        case 'V':
                            path.lineTo(f12, fArr2[i10 + 0]);
                            f10 = f11;
                            i3 = i8;
                            i2 = fArr2[i10 + 0];
                            f = f12;
                            break;
                        case 'a':
                            drawArc(path, f12, i9, fArr2[i10 + 5] + f12, fArr2[i10 + 6] + i9, fArr2[i10 + 0], fArr2[i10 + 1], fArr2[i10 + 2], fArr2[i10 + 3] != 0.0f, fArr2[i10 + 4] != 0.0f);
                            float f21 = f12 + fArr2[i10 + 5];
                            float f22 = i9 + fArr2[i10 + 6];
                            f10 = f11;
                            f3 = f22;
                            i3 = i8;
                            f2 = f21;
                            i2 = f22;
                            f = f21;
                            break;
                        case 'c':
                            path.rCubicTo(fArr2[i10 + 0], fArr2[i10 + 1], fArr2[i10 + 2], fArr2[i10 + 3], fArr2[i10 + 4], fArr2[i10 + 5]);
                            f2 = f12 + fArr2[i10 + 2];
                            f3 = fArr2[i10 + 3] + i9;
                            float f23 = f12 + fArr2[i10 + 4];
                            f10 = f11;
                            i3 = i8;
                            i2 = i9 + fArr2[i10 + 5];
                            f = f23;
                            break;
                        case 'h':
                            path.rLineTo(fArr2[i10 + 0], 0.0f);
                            f10 = f11;
                            i3 = i8;
                            i2 = i9;
                            f = f12 + fArr2[i10 + 0];
                            break;
                        case 'l':
                            path.rLineTo(fArr2[i10 + 0], fArr2[i10 + 1]);
                            float f24 = f12 + fArr2[i10 + 0];
                            f10 = f11;
                            i3 = i8;
                            i2 = i9 + fArr2[i10 + 1];
                            f = f24;
                            break;
                        case 'm':
                            float f25 = f12 + fArr2[i10 + 0];
                            float f26 = i9 + fArr2[i10 + 1];
                            if (i10 <= 0) {
                                path.rMoveTo(fArr2[i10 + 0], fArr2[i10 + 1]);
                                f10 = f25;
                                i3 = f26;
                                i2 = f26;
                                f = f25;
                                break;
                            } else {
                                path.rLineTo(fArr2[i10 + 0], fArr2[i10 + 1]);
                                f10 = f11;
                                i3 = i8;
                                i2 = f26;
                                f = f25;
                                break;
                            }
                        case 'q':
                            path.rQuadTo(fArr2[i10 + 0], fArr2[i10 + 1], fArr2[i10 + 2], fArr2[i10 + 3]);
                            f2 = f12 + fArr2[i10 + 0];
                            f3 = fArr2[i10 + 1] + i9;
                            float f27 = f12 + fArr2[i10 + 2];
                            f10 = f11;
                            i3 = i8;
                            i2 = i9 + fArr2[i10 + 3];
                            f = f27;
                            break;
                        case 's':
                            float f28 = 0.0f;
                            if (c == 'c' || c == 's' || c == 'C' || c == 'S') {
                                f28 = f12 - f2;
                                f7 = i9 - f3;
                            } else {
                                f7 = 0.0f;
                            }
                            path.rCubicTo(f28, f7, fArr2[i10 + 0], fArr2[i10 + 1], fArr2[i10 + 2], fArr2[i10 + 3]);
                            f2 = f12 + fArr2[i10 + 0];
                            f3 = fArr2[i10 + 1] + i9;
                            float f29 = f12 + fArr2[i10 + 2];
                            f10 = f11;
                            i3 = i8;
                            i2 = i9 + fArr2[i10 + 3];
                            f = f29;
                            break;
                        case 't':
                            float f30 = 0.0f;
                            if (c == 'q' || c == 't' || c == 'Q' || c == 'T') {
                                float f31 = f12 - f2;
                                float f32 = i9 - f3;
                                f4 = f31;
                                f30 = f32;
                            } else {
                                f4 = 0.0f;
                            }
                            path.rQuadTo(f4, f30, fArr2[i10 + 0], fArr2[i10 + 1]);
                            f2 = f12 + f4;
                            f3 = i9 + f30;
                            float f33 = f12 + fArr2[i10 + 0];
                            f10 = f11;
                            i3 = i8;
                            i2 = i9 + fArr2[i10 + 1];
                            f = f33;
                            break;
                        case 'v':
                            path.rLineTo(0.0f, fArr2[i10 + 0]);
                            f10 = f11;
                            i3 = i8;
                            i2 = i9 + fArr2[i10 + 0];
                            f = f12;
                            break;
                        default:
                            f10 = f11;
                            i3 = i8;
                            i2 = i9;
                            f = f12;
                            break;
                    }
                    i7 = i10 + i;
                    i8 = i3;
                    c = c2;
                } else {
                    fArr[0] = f12;
                    fArr[1] = i9;
                    fArr[2] = f2;
                    fArr[3] = f3;
                    fArr[4] = f11;
                    fArr[5] = i8;
                    return;
                }
            }
        }

        private static void arcToBezier(Path path, double d, double d2, double d3, double d4, double d5, double d6, double d7, double d8, double d9) {
            int ceil = (int) Math.ceil(Math.abs((4.0d * d9) / 3.141592653589793d));
            double cos = Math.cos(d7);
            double sin = Math.sin(d7);
            double cos2 = Math.cos(d8);
            double sin2 = Math.sin(d8);
            double d10 = (((-d3) * cos) * sin2) - ((d4 * sin) * cos2);
            double d11 = (sin2 * (-d3) * sin) + (cos2 * d4 * cos);
            double d12 = d9 / ((double) ceil);
            int i = 0;
            while (i < ceil) {
                double d13 = d8 + d12;
                double sin3 = Math.sin(d13);
                double cos3 = Math.cos(d13);
                double d14 = (((d3 * cos) * cos3) + d) - ((d4 * sin) * sin3);
                double d15 = (d3 * sin * cos3) + d2 + (d4 * cos * sin3);
                double d16 = (((-d3) * cos) * sin3) - ((d4 * sin) * cos3);
                double d17 = (cos3 * d4 * cos) + (sin3 * (-d3) * sin);
                double tan = Math.tan((d13 - d8) / 2.0d);
                double sqrt = ((Math.sqrt((tan * (3.0d * tan)) + 4.0d) - 1.0d) * Math.sin(d13 - d8)) / 3.0d;
                path.rLineTo(0.0f, 0.0f);
                path.cubicTo((float) ((sqrt * d10) + d5), (float) ((sqrt * d11) + d6), (float) (d14 - (sqrt * d16)), (float) (d15 - (sqrt * d17)), (float) d14, (float) d15);
                i++;
                d8 = d13;
                d6 = d15;
                d10 = d16;
                d5 = d14;
                d11 = d17;
            }
        }

        private static void drawArc(Path path, float f, float f2, float f3, float f4, float f5, float f6, float f7, boolean z, boolean z2) {
            double d;
            double d2;
            double radians = Math.toRadians((double) f7);
            double cos = Math.cos(radians);
            double sin = Math.sin(radians);
            double d3 = ((((double) f) * cos) + (((double) f2) * sin)) / ((double) f5);
            double d4 = ((((double) (-f)) * sin) + (((double) f2) * cos)) / ((double) f6);
            double d5 = ((((double) f3) * cos) + (((double) f4) * sin)) / ((double) f5);
            double d6 = ((((double) (-f3)) * sin) + (((double) f4) * cos)) / ((double) f6);
            double d7 = d3 - d5;
            double d8 = d4 - d6;
            double d9 = (d3 + d5) / 2.0d;
            double d10 = (d4 + d6) / 2.0d;
            double d11 = (d7 * d7) + (d8 * d8);
            if (d11 == 0.0d) {
                Log.w(PathParser.LOGTAG, " Points are coincident");
                return;
            }
            double d12 = (1.0d / d11) - 0.25d;
            if (d12 < 0.0d) {
                Log.w(PathParser.LOGTAG, "Points are too far apart " + d11);
                float sqrt = (float) (Math.sqrt(d11) / 1.99999d);
                drawArc(path, f, f2, f3, f4, f5 * sqrt, f6 * sqrt, f7, z, z2);
                return;
            }
            double sqrt2 = Math.sqrt(d12);
            double d13 = d7 * sqrt2;
            double d14 = d8 * sqrt2;
            if (z == z2) {
                d = d9 - d14;
                d2 = d13 + d10;
            } else {
                d = d14 + d9;
                d2 = d10 - d13;
            }
            double atan2 = Math.atan2(d4 - d2, d3 - d);
            double atan22 = Math.atan2(d6 - d2, d5 - d) - atan2;
            if (z2 != (atan22 >= 0.0d)) {
                atan22 = atan22 > 0.0d ? atan22 - 6.283185307179586d : atan22 + 6.283185307179586d;
            }
            double d15 = ((double) f5) * d;
            double d16 = d2 * ((double) f6);
            arcToBezier(path, (d15 * cos) - (d16 * sin), (d15 * sin) + (d16 * cos), (double) f5, (double) f6, (double) f, (double) f2, radians, atan2, atan22);
        }

        public static void nodesToPath(PathDataNode[] pathDataNodeArr, Path path) {
            float[] fArr = new float[6];
            char c = 'm';
            for (int i = 0; i < pathDataNodeArr.length; i++) {
                addCommand(path, fArr, c, pathDataNodeArr[i].type, pathDataNodeArr[i].params);
                c = pathDataNodeArr[i].type;
            }
        }

        public void interpolatePathDataNode(PathDataNode pathDataNode, PathDataNode pathDataNode2, float f) {
            for (int i = 0; i < pathDataNode.params.length; i++) {
                this.params[i] = (pathDataNode.params[i] * (1.0f - f)) + (pathDataNode2.params[i] * f);
            }
        }
    }

    PathParser() {
    }

    private static void addNode(ArrayList<PathDataNode> arrayList, char c, float[] fArr) {
        arrayList.add(new PathDataNode(c, fArr));
    }

    public static boolean canMorph(PathDataNode[] pathDataNodeArr, PathDataNode[] pathDataNodeArr2) {
        if (pathDataNodeArr == null || pathDataNodeArr2 == null || pathDataNodeArr.length != pathDataNodeArr2.length) {
            return false;
        }
        for (int i = 0; i < pathDataNodeArr.length; i++) {
            if (pathDataNodeArr[i].type != pathDataNodeArr2[i].type || pathDataNodeArr[i].params.length != pathDataNodeArr2[i].params.length) {
                return false;
            }
        }
        return true;
    }

    static float[] copyOfRange(float[] fArr, int i, int i2) {
        if (i > i2) {
            throw new IllegalArgumentException();
        }
        int length = fArr.length;
        if (i < 0 || i > length) {
            throw new ArrayIndexOutOfBoundsException();
        }
        int i3 = i2 - i;
        int min = Math.min(i3, length - i);
        float[] fArr2 = new float[i3];
        System.arraycopy(fArr, i, fArr2, 0, min);
        return fArr2;
    }

    public static PathDataNode[] createNodesFromPathData(String str) {
        if (str == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        int i = 1;
        int i2 = 0;
        while (i < str.length()) {
            int nextStart = nextStart(str, i);
            String trim = str.substring(i2, nextStart).trim();
            if (trim.length() > 0) {
                addNode(arrayList, trim.charAt(0), getFloats(trim));
            }
            i = nextStart + 1;
            i2 = nextStart;
        }
        if (i - i2 == 1 && i2 < str.length()) {
            addNode(arrayList, str.charAt(i2), new float[0]);
        }
        return (PathDataNode[]) arrayList.toArray(new PathDataNode[arrayList.size()]);
    }

    public static Path createPathFromPathData(String str) {
        Path path = new Path();
        PathDataNode[] createNodesFromPathData = createNodesFromPathData(str);
        if (createNodesFromPathData == null) {
            return null;
        }
        try {
            PathDataNode.nodesToPath(createNodesFromPathData, path);
            return path;
        } catch (RuntimeException e) {
            throw new RuntimeException("Error in parsing " + str, e);
        }
    }

    public static PathDataNode[] deepCopyNodes(PathDataNode[] pathDataNodeArr) {
        if (pathDataNodeArr == null) {
            return null;
        }
        PathDataNode[] pathDataNodeArr2 = new PathDataNode[pathDataNodeArr.length];
        for (int i = 0; i < pathDataNodeArr.length; i++) {
            pathDataNodeArr2[i] = new PathDataNode(pathDataNodeArr[i]);
        }
        return pathDataNodeArr2;
    }

    private static void extract(String str, int i, ExtractFloatResult extractFloatResult) {
        extractFloatResult.mEndWithNegOrDot = false;
        boolean z = false;
        boolean z2 = false;
        boolean z3 = false;
        for (int i2 = i; i2 < str.length(); i2++) {
            switch (str.charAt(i2)) {
                case ' ':
                case ',':
                    z3 = true;
                    z = false;
                    break;
                case '-':
                    if (i2 != i && !z) {
                        extractFloatResult.mEndWithNegOrDot = true;
                        z3 = true;
                        z = false;
                        break;
                    } else {
                        z = false;
                        break;
                    }
                case '.':
                    if (z2) {
                        extractFloatResult.mEndWithNegOrDot = true;
                        z3 = true;
                        z = false;
                        break;
                    } else {
                        z = false;
                        z2 = true;
                        break;
                    }
                case 'E':
                case 'e':
                    z = true;
                    break;
                default:
                    z = false;
                    break;
            }
            if (z3) {
                extractFloatResult.mEndPosition = i2;
            }
        }
        extractFloatResult.mEndPosition = i2;
    }

    private static float[] getFloats(String str) {
        int i;
        int i2 = 1;
        int i3 = 0;
        if ((str.charAt(0) == 'z') || (str.charAt(0) == 'Z')) {
            return new float[0];
        }
        try {
            float[] fArr = new float[str.length()];
            ExtractFloatResult extractFloatResult = new ExtractFloatResult();
            int length = str.length();
            while (i2 < length) {
                extract(str, i2, extractFloatResult);
                int i4 = extractFloatResult.mEndPosition;
                if (i2 < i4) {
                    i = i3 + 1;
                    fArr[i3] = Float.parseFloat(str.substring(i2, i4));
                } else {
                    i = i3;
                }
                if (extractFloatResult.mEndWithNegOrDot) {
                    i3 = i;
                    i2 = i4;
                } else {
                    i2 = i4 + 1;
                    i3 = i;
                }
            }
            return copyOfRange(fArr, 0, i3);
        } catch (NumberFormatException e) {
            throw new RuntimeException("error in parsing \"" + str + "\"", e);
        }
    }

    private static int nextStart(String str, int i) {
        while (i < str.length()) {
            char charAt = str.charAt(i);
            if (((charAt - 'A') * (charAt - 'Z') <= 0 || (charAt - 'a') * (charAt - 'z') <= 0) && charAt != 'e' && charAt != 'E') {
                break;
            }
            i++;
        }
        return i;
    }

    public static void updateNodes(PathDataNode[] pathDataNodeArr, PathDataNode[] pathDataNodeArr2) {
        for (int i = 0; i < pathDataNodeArr2.length; i++) {
            pathDataNodeArr[i].type = (char) pathDataNodeArr2[i].type;
            for (int i2 = 0; i2 < pathDataNodeArr2[i].params.length; i2++) {
                pathDataNodeArr[i].params[i2] = pathDataNodeArr2[i].params[i2];
            }
        }
    }
}
