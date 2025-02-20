const std = @import("std");

fn safeDivide(a: i32, b: i32) ?i32 {
    if (b == 0) {
        return null;
    } else {
        return @divTrunc(a, b);
    }
}

pub fn main() !void {
    var a: i32 = 30;
    var b: i32 = 0;
    std.debug.print("{} divided by {} is {any}\n", .{ a, b, safeDivide(a, b) });
    a = 40;
    b = 15;
    std.debug.print("{} divided by {} is {any}\n", .{ a, b, safeDivide(a, b) });
}
