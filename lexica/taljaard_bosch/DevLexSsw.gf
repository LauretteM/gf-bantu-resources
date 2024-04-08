concrete DevLexSsw of DevLex = CatSsw ** open ResSsw, ParadigmsSsw in {

  lin
    -- adjectives
    bad_A = mkA "bi" ;
    big_A = mkA "khulu" ;
    good_A = mkA "hle" ;
    how_much_A = mkA "ngakhi" ;
    small_A = mkA "fishane" ;
    three_A = mkA "tsatfu" ;
    
    -- relative stems
    honest_R = mkRelA "cotfo" ;
    nice_R = mkRelA "mnandzi" ;
    red_R = mkRelA "bovu" ;
    spotted_R = mkRelA "mabalabala" ;
    
    -- adverbs
    -- no lin for above_Adv
    always_Adv = mkAdv "njalo" ;
    down_Adv = mkAdv "phansi" ;
    in_the_afternoon_Adv = mkAdv "ntsambama" ;
    -- no lin for inside_Adv
    like_this_Adv = mkAdv "kanje" ;
    now_Adv = mkAdv "manje" ;
    only_Adv = mkAdv "kuphela" ;
    outside_Adv = mkAdv "phandle" ;
    quickly_Adv = mkAdv "masinya" ;
    today_Adv = mkAdv "lamuhla" ;
    when_Adv = mkAdv "nini" ;
    yesterday_Adv = mkAdv "itolo" ;
    yonder_Adv = mkAdv "laphayi" ;
    
    -- nouns
    animal_N = mkN "lwane" C7_8 ;
    baboon_N = mkN "fene" C9_10 ;
    bird_N = mkN "nyoni" C9_10 ;
    blanket_N = mkN "ngubo" C9_10 ;
    book_N = mkN "ncwadzi" C9_10 ;
    boy_N = mkN "fana" C1_2 ;
    box_N = mkN "bhokisi" C5_6 ;
    bread_N = mkN "nkhwa" C7_8 ;
    builder_N = mkN "akhi" C1_2 ;
    car_N = mkN "moto" C9_10 ;
    cat_N = mkN "kati" C5_6 ;
    child_N = mkN "ntfwana" C1_2 ;
    child_2_N = mkN "ntfwana" C1_2 ;
    clay_pot_N = mkN "dziwo" C11_10 ;
    clothing_N = mkN "embatfo" C7_8 ;
    cow_N = mkN "khomo" C9_10 ;
    customer_N = mkN "tsengi" C1_2 ;
    dog_N = mkN "nja" C9_10 ;
    elephant_N = mkN "dlovu" C9_10 ;
    farmer_N = mkN "limi" C1_2 ;
    father_N = mkN "babe" C1_2 ;
    field_N = mkN "simu" C9_6 ;
    finger_N = mkN "no" C3_4 ;
    fire_N = mkN "lilo" C3_4 ;
    firewood_N = mkN "khuni" C9_10 ;
    food_N = mkN "dla" C15 ;
    forest_N = mkN "hlatsi" C5_6 ;
    gangster_N = mkN "gebengu" C7_8 ;
    gate_N = mkN "sango" C5_6 ;
    girl_N = mkN "tfombi" C9_10 ;
    goods_N = mkN "phahla" C9_10 ;
    grandfather_N = mkN "mkhulu" C1a_2a ;
    grandmother_N = mkN "gogo" C1a_2a ;
    grass_N = mkN "tjani" "tjani" "etjanini" "etjanini" C14 ;
    hare_N = mkN "logwaja" C1a_2a ;
    herd_boy_N = mkN "umalusi" "belusi" "kumalusi" "kubelusi" C1_2 ;
    his_father_N = mkN "yise" C1a_2a ;
    home_N = mkN "khaya" "ekhaya" "emakhaya" C5_6 ;
    horse_N = mkN "hhashi" C5_6 ;
    kraal_N = mkN "baya" C7_8 ;
    lion_N = mkN "bhubesi" C5_6 ;
    man_N = mkN "dvodza" C9_6 ;
    meat_N = mkN "nyama" C9_10 ;
    messenger_N = mkN "gijimi" C7_8 ;
    money_N = mkN "mali" C9_10 ;
    mother_N = mkN "make" C1a_2a ;
    mountain_N = mkN "ntsaba" C9_10 ;
    nonsense_N = mkN "hhala" C5_6 ;
    old_woman_N = mkN "alukati" C7_8 ;
    overcoat_N = mkN "jazi" C5_6 ;
    ox_N = mkN "khabi" C9_10 ;
    person_N = mkN "ntfu" C1_2 ;
    pumpkin_porridge_N = mkN "dvudvu" C7_8 ;
    river_N = mkN "fula" C3_4 ;
    scholar_N = mkN "fundi" C1_2 ;
    school_N = mkN "kolo" C7_8 ;
    sheep_N = mkN "vu" C9_10 ;
    shirt_N = mkN "yembe" C5_6 ;
    sister_N = mkN "dzadzewenu" C1a_2a ;
    snake_N = mkN "nyoka" C9_10 ;
    soccer_N = mkN "bhola" C5_6 ;
    sore_N = mkN "londza" C7_8 ;
    spoon_N = mkN "khezo" C11_10 ;
    student_N = mkN "tshudeni" C7_8 ;
    table_N = mkN "tafula" C5_6 ;
    thief_N = mkN "seta" C5_6 ;
    town_N = mkN "dolobha" C5_6 ;
    toy_N = mkN "ti" C3_4 ;
    tree_N = mkN "ti" C3_4 ;
    uncle_N = mkN "malume" C1a_2a ;
    village_N = mkN "ti" C3_4 ;
    water_N = mkN "nti" C5_6 ;
    wife_N = mkN "fati" C1_2 ;
    window_N = mkN "fasitelo" C5_6 ;
    woman_N = mkN "fati" C1_2 ;
    worker_N = mkN "sebenti" C7_8 ;
    
    -- verbs
    bark_V = mkV "khonkhots" ;
    be_clean_V = mkV "hlob" ;
    become_hungry_V = mkV "lamb" ;
    bite_V2 = mkV2 "lum" ;
    bleed_V = mkV "oph" ;
    break_V2 = mkV2 "ephul" ;
    bring_V = mkV "lets" ;
    build_V = mkV "akh" ;
    build_V2 = mkV2 "akh" ;
    burn_V = mkV "shis" ;
    burn_2_V = mkV "vuts" ;
    buy_V = mkV "tseng" ;
    buy_V2 = mkV2 "tseng" ;
    call_V2 = mkV2 "bit" ;
    come_V = mkV "y" ;
    cook_V = mkV "phek" ;
    cook_V2 = mkV2 "phek" ;
    cry_V = mkV "khal" ;
    -- no lin for dance_V
    dance_2_V = mkV "sin" ;
    descend_V = mkV "ehl" ;
    die_V = mkV "f" ;
    distribute_V2 = mkV2 "ab" ;
    do_V = mkV "ent" ;
    do_wrong_V = mkV "on" ;
    drink_V = mkV "nats" ;
    drink_V2 = mkV2 "nats" ;
    dry_V = mkV "om" ;
    eat_V = mkV "dl" ;
    eat_V2 = mkV2 "dl" ;
    end_V = mkV "phel" "phela" "phelile" "phele" ;
    enter_V = mkV "ngen" ;
    fall_V = mkV "wel" ;
    -- no lin for fly_V
    gather_firewood_V = mkV "tfot" ;
    get_thin_V = mkV "ondz" ;
    go_V = mkV "hamb" ;
    go_2_V = mkV "y" ;
    hit_V = mkV "shay" ;
    hit_V2 = mkV2 "shay" ;
    hold_V = mkV "bamb" ;
    jump_over_V2 = mkV2 "ec" ;
    kiss_V2 = mkV2 "ang" ;
    learn_V = mkV "fundz" ;
    lift_up_V = mkV "phakamis" ;
    like_V2 = mkV2 "tsandz" ;
    look_V = mkV "bhek" ;
    look_V2 = mkV2 "bhek" ;
    meet_V = mkV "hlangan" ;
    milk_V = mkV "seng" ;
    open_V2 = mkV2 "vul" ;
    -- no lin for place_across_V2
    play_V = mkV "dlal" ;
    play_V2 = mkV2 "dlal" ;
    plough_V = mkV "lim" ;
    plough_V2 = mkV2 "lim" ;
    read_V = mkV "fundz" ;
    read_V2 = mkV2 "fundz" ;
    receive_V2 = mkV2 "amukel" ;
    refuse_V = mkV "al" ;
    refuse_V2 = mkV2 "al" ;
    return_V = mkV "buy" ;
    roast_V = mkV "os" ;
    roast_V2 = mkV2 "os" ;
    -- no lin for rule_V
    run_V = mkV "gijim" ;
    run_away_V = mkV "balek" ;
    save_V2 = mkV2 "ong" ;
    see_V2 = mkV2 "bon" ;
    shout_V = mkV "memet" ;
    sit_V = mkV "hlal" "hlala" "hlezi" "hlezi" ;
    sleep_V = mkV "lal" ;
    spill_V = mkV "cits" ;
    survive_V = mkV "sindz" ;
    stay_V = mkV "sal" ;
    steal_V = mkV "eb" ;
    steal_V2 = mkV2 "eb" ;
    take_V2 = mkV2 "tsats" ;
    talk_V = mkV "khulum" ;
    talk_V2 = mkV2 "khulum" ;
    tire_V = mkV "dziniw" ;
    tire_2_V = mkV "khatsal" ;
    try_V = mkV "tam" ;
    visit_V = mkV "vakash" ;
    visit_V2 = mkV2 "vakashel" ;
    want_V2 = mkV2 "fun" ;
    wash_V2 = mkV2 "hlant" ;
    wear_V2 = mkV2 "embats" ;
    work_V = mkV "sebent" ;
    
    -- verbs with VP arguments
    do_not_VV = mkVV "mus" ;
    refuse_VV = mkVV "al" ;
    
    -- verbs with phrase arguments
    
    -- other verbs
    
    -- PN
    Mbube_PN = mkPN "Mbube" C1_2 ;
    Motsa_PN = mkPN "Motsa" C1_2 ;
    Shaka_PN = mkPN "Shaka" C1_2 ;
    
    
}