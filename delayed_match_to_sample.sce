# Delayed match to sample
scenario = "Delayed Match to Sample";

default_font_size = 20;
default_font = "Arial";
default_text_color = 0,0,0;
default_background_color = 255,255,255;
active_buttons = 4;
button_codes = 1,2,3,4;
response_matching = simple_matching;
stimulus_properties = trial_phase, string, cue, string, cue_durations, number, cuestatus, string, target, string, ITI, number, trial_number, number;
event_code_delimiter = ",";
pcl_file = "delayed_match_to_sample.pcl";
begin;

#Objects
#Instructions
text{caption="Kedves Résztvevő!\n
A következőkben egy ábrát fog látni egy különös tárgyról.\n 
Kérjük, figyelje meg alaposan a tárgyat és jegyezze meg azt.\n
Miután az ábra eltűnt, egy színes háttér felvillanása után\n újabb négy tárgyat fog látni, amelyből az egyik ugyanaz,\n mint amit korábban látott.\n
Az 1, 2, 3, vagy 4 gomb lenyomásával jelezze,\n hogy hanyadik tárgyat látta korábban.\n
A válaszadásra 5 másodpercig van lehetősége,\n utána újabb árbra fog megjelenni a képernyőn,\n ezért igyekezzen minél hamarabb válaszolni.\n\n
Kérjük, nyomjon meg egy számot a továbblépéshez!";
}instructions_text;

#Stimuli
bitmap{filename=" "; preload = false;} target_bitmap;

picture{text instructions_text;x=0;y=0;}instructions_picture;
picture{bitmap target_bitmap; x = 0; y = 0;}target_picture;
picture{
    bitmap {filename=" "; preload=false;}first_choice; x = -495; y = -200; #first choice 
    bitmap {filename=" "; preload=false;}second_choice; x = -165; y = -200; #second choice
    bitmap {filename=" "; preload=false;}third_choice; x = 165; y = -200; #third choice
    bitmap {filename=" "; preload=false;}fourth_choice; x = 495; y = -200; #fourth choice
} choices_picture;

#Mask and blank screen
picture{background_color = 255,255,255;} blank_screen;
picture{bitmap {filename="mask.bmp";};x=0;y=0;} mask_picture;

#Trials
trial{trial_duration = forever; trial_type = first_response; stimulus_event{picture instructions_picture; time=0;}instructions_event;}instructions_trial;
trial{trial_duration = 1000; trial_type = fixed; stimulus_event{picture blank_screen; time = 0;}blank_event;}blank_trial;
trial{trial_duration = 2000; trial_type = fixed; stimulus_event{picture target_picture; time = 0;}target_event;}target_trial;
trial{trial_duration = 2000; trial_type = fixed; stimulus_event{picture mask_picture; time = 0;}mask_event;}mask_trial;
trial{trial_duration = 5000; trial_type = first_response; stimulus_event{picture choices_picture; duration = 5000; target_button = 1;}choice_event;}choice_trial;