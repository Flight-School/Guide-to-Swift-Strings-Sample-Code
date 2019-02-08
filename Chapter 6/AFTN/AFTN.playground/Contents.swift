import AFTN

let string = """
ZCZC NRA062 270930
GG KHIOYYYX
311521 KTTDZTZX

AIR SWIFT FLIGHT 42
CANCELLED

NNNN
"""

let message = try Message(string)!
message.priority
message.destination.location
message.destination.organization
message.destination.department
message.filingTime
message.text
