const std = @import("std");

fn ask_user(prompt: []const u8) !i64 {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    var buf: [20]u8 = undefined; // Increased buffer size for larger numbers

    try stdout.print("{s}", .{prompt});

    if (try stdin.readUntilDelimiterOrEof(&buf, '\n')) |user_input| {
        // Trim any trailing whitespace (including \r, \n)
        const trimmed_input = std.mem.trim(u8, user_input, " \r\n");

        return std.fmt.parseInt(i64, trimmed_input, 10) catch |err| {
            std.debug.print("Invalid input: {}\n", .{err});
            return error.InvalidNumber;
        };
    } else {
        return 0;
    }
}

pub fn main() !void {
    const num1 = ask_user("Enter first number: ") catch |err| {
        std.debug.print("Error: {}\n", .{err});
        return;
    };

    const num2 = ask_user("Enter second number: ") catch |err| {
        std.debug.print("Error: {}\n", .{err});
        return;
    };

    const sum = num1 + num2;
    const product = num1 * num2;
    std.debug.print("The sum of {} and {} is {}\n", .{ num1, num2, sum });
    std.debug.print("The product is {}\n", .{product});
}
