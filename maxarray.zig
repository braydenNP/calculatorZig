const std = @import("std");

pub fn main() !void {
    const numbers = [_]i32{ 12, 45, 7, 89, 23, 56, 99, 34 }; // Define an array of integers
    var max = numbers[0]; // Assume first number is the maximum

    for (numbers) |num| {
        if (num > max) {
            max = num;
        }
    }
    std.debug.print("The maximum number is {}\n", .{max});
}
