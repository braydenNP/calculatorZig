const std = @import("std");

pub fn main() !void {
    var numbers = [_]i32{ 12, 45, 7, 89, 23, 56, 99, 34 }; // Define an array of integers
    const len = numbers.len;

    var start: usize = 0;
    var end: usize = len - 1;
    while (start < end) {
        const temp = numbers[start];
        numbers[start] = numbers[end];
        numbers[end] = temp;
        start += 1;
        end -= 1;
    }

    std.debug.print("Reversed array is {any}\n", .{numbers});
}
