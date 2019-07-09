#Delayed match to sample task
#By Ilyés Alex
#According to Bellander et al, 2016
scenario = "Delayed Match to Sample";

#Default values
default_font_size = 20;
default_font = "Arial";
default_text_color = 0,0,0;
default_background_color = 255,255,255;
active_buttons = 4;
button_codes = 1,2,3,4;
response_matching = simple_matching;
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
A válaszadásra 5 másodpercig van lehetősége,\n utána újabb ábra fog megjelenni a képernyőn. \n Kérjük próbáljon minél gyorsabban és minél pontosabban válaszolni.\n\n
Először egy gyakorló fázis következik, ahol kipróbálhatja a feladatot.\n\nItt még fog kapni visszajelzést a válaszairól, később már nem.\n\n
Kérjük, nyomjon meg egy számot a továbblépéshez!";
}instructions_text;

#Stimuli
#Bitmap for the target, the pcl fills the filename with the proper call
bitmap{filename=" "; preload = false;} target_bitmap;
#Pictures for the whole screen
#Instructions screen
picture{text instructions_text;x=0;y=0;}instructions_picture;
#Target screen
picture{bitmap target_bitmap; x = 0; y = 0;}target_picture;
#The variants which appear within the same picture, but at different positions - with their respective target number under them
#They are on the bottom of the screen, beside each other, the same distance from each other
picture{
    bitmap {filename=" "; preload=false;}first_choice; x = -495; y = -200; #first variant 
    bitmap {filename=" "; preload=false;}second_choice; x = -165; y = -200; #second variant
    bitmap {filename=" "; preload=false;}third_choice; x = 165; y = -200; #third variant
    bitmap {filename=" "; preload=false;}fourth_choice; x = 495; y = -200; #fourth variant
    text {caption="1"; font_size = 50;}number_text1; x = -495; y = -320;
    text {caption="2"; font_size = 50;}number_text2; x = -165; y = -320;
    text {caption="3"; font_size = 50;}number_text3; x = 165; y = -320;
    text {caption="4"; font_size = 50;}number_text4; x = 495; y = -320;
} choices_picture;

#Mask and blank screen
picture{background_color = 255,255,255;} blank_screen;
picture{bitmap {filename="mask.bmp";};x=0;y=0;} mask_picture;

#Trials, which contain the screens as events + added a break trial, which will be presented at the middle (after 50 trials)
trial{trial_duration = forever; trial_type = first_response; stimulus_event{picture instructions_picture; time=0;}instructions_event;}instructions_trial;
trial{trial_duration = 1000; trial_type = fixed; stimulus_event{picture blank_screen; time = 0;}blank_event;}blank_trial;
trial{trial_duration = 2000; trial_type = fixed; stimulus_event{picture target_picture; time = 0;}target_event;}target_trial;
trial{trial_duration = 2000; trial_type = fixed; stimulus_event{picture mask_picture; time = 0;}mask_event;}mask_trial;
trial{trial_duration = 5000; trial_type = fixed; stimulus_event{picture choices_picture; duration = 5000; target_button = 1;}choice_event;}choice_trial;
trial{trial_duration = forever; trial_type = first_response; stimulus_event{picture{text{caption = "Most egy kis szünet következik!\n\n A szünet alatt pihentetheti a szemét és az ujjait.\n\n Ha készen áll a folytatára, nyomjon meg egy számot és folytatódik a feladat!";} break_text; x = 0; y = 0;}break_picture;}break_event;}break_trial;
