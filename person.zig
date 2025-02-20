const std = @import("std");

const Status = enum { Active, Inactive };

const Person = struct {
    name: [20]u8,
    age: i32,
    status: Status,
};

fn addAge(person: *Person) void {
    person.age += 1;
    if (person.status == Status.Inactive) {
        person.status = Status.Active;
    }
}

pub fn main() !void {
    var name: [20]u8 = undefined; // Declare an uninitialized array
    const source = "Brayden";

    @memcpy(name[0..source.len], source); // Copy "Brayden" into `name`

    var person = Person{ .name = name, .age = 20, .status = Status.Inactive };

    std.debug.print("Person Name: {s}, Person Age: {}, Person Status: {}\n", .{ person.name, person.age, person.status });
    addAge(&person);
    std.debug.print("Person Name: {s}, Person Age: {}, Person Status: {}\n", .{ person.name, person.age, person.status });
}
