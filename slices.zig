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
    var my_array = [_]i32{};
    while (true) {
        const input = ask_user("Enter number to add: ");
        if (input == error.InvalidNumber) {
            break;
        }
        my_array.add(input);
    }
    std.debug.print("{any}", .{my_array});
}
