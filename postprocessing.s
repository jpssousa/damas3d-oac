# Postprocessing function

# Calls the PRINT functions to refresh the game board on the screen
# Call CAPTURE_CHECK for the destination address and see if the piece can eat one more time
# If CAPTURE_CHECK returns (a2) 1, jumps inconditionally to PLAY_AGAIN to let the player continue capturing
# If CAPTURE_CHECK returns (a2) 0, checks whether the destionation address it at the last row
# If it is, promote the piece if it can be promoted and pass the turn

# Receives as argument:
# a0 = origin
# a1 = destination
# a2 = 0 (move), 1 (capture)
# a3 = 1 (player 1), 2 (player 2)
# a4 = 0 (no capture), address of captured piece (if capture)

##########################################
# s0 is the initial address of the board #
# s1 is the final address of the board   #
# s2 is the number of cpu tokens         #
# s3 is the number of player tokens      #
##########################################

# memory = [s1][64 bits board][s0]

POSTPROCESSING:
