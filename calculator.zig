const std = @import("std");

// Return number from the user input
fn ask_user(prompt: []const u8) !i64 {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    var buf: [20]u8 = undefined;

    try stdout.print("{s}", .{prompt});

    if (try stdin.readUntilDelimiterOrEof(&buf, '\n')) |user_input| {
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
    while (true) {
        std.debug.print("Calculator App \n[1] Add two numbers \n[2] Multiply two numbers \n[0] Exit\n", .{});
        const choice = ask_user("Enter your option: ") catch |err| {
            std.debug.print("Error: {}\n", .{err});
            return;
        };
        if (choice == 1) {
            const num1 = ask_user("Enter first number: ") catch |err| {
                std.debug.print("Error: {}\n", .{err});
                return;
            };

            const num2 = ask_user("Enter second number: ") catch |err| {
                std.debug.print("Error: {}\n", .{err});
                return;
            };
            std.debug.print("The sum of {} and {} is {}\n", .{ num1, num2, num1 + num2 });
        } else if (choice == 2) {
            const num1 = ask_user("Enter first number: ") catch |err| {
                std.debug.print("Error: {}\n", .{err});
                return;
            };

            const num2 = ask_user("Enter second number: ") catch |err| {
                std.debug.print("Error: {}\n", .{err});
                return;
            };
            std.debug.print("The product of {} and {} is {}\n", .{ num1, num2, num1 * num2 });
        } else if (choice == 0) {
            std.debug.print("Bye bye!\n", .{});
            break;
        }
    }
}
