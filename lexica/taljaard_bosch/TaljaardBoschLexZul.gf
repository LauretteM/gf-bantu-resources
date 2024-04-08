concrete TaljaardBoschLexZul of TaljaardBoschLex = CatZul ** open ResZul, ParadigmsZul in {

  lin
    -- adjectives
    bad_A = mkA "bi" ;
    big_A = mkA "khulu" ;
    good_A = mkA "hle" ;
    how_much_A = mkA "ngaki" ;
    small_A = mkA "fuphi" ;
    three_A = mkA "thathu" ;
    
    -- relative stems
    honest_R = mkRelA "qotho" ;
    nice_R = mkRelA "mnandi" ;
    red_R = mkRelA "bomvu" ;
    spotted_R = mkRelA "mabalabala" ;
    
    -- adverbs
    above_Adv = mkAdv "phezulu" ;
    always_Adv = mkAdv "njalo" ;
    down_Adv = mkAdv "phansi" ;
    in_the_afternoon_Adv = mkAdv "ntambama" ;
    inside_Adv = mkAdv "phakathi" ;
    like_this_Adv = mkAdv "kanje" ;
    now_Adv = mkAdv "manje" ;
    only_Adv = mkAdv "kuphela" ;
    outside_Adv = mkAdv "phandle" ;
    quickly_Adv = mkAdv "masinya" ;
    today_Adv = mkAdv "namuhla" ;
    when_Adv = mkAdv "nini" ;
    yesterday_Adv = mkAdv "izolo" ;
    yonder_Adv = mkAdv "laphaya" ;
    
    -- nouns
    animal_N = mkN "lwane" C7_8 ;
    baboon_N = mkN "fene" C9_10 ;
    bird_N = mkN "nyoni" C9_10 ;
    blanket_N = mkN "ngubo" C9_10 ;
    book_N = mkN "ncwadi" C9_10 ;
    boy_N = mkN "fana" C1_2 ;
    box_N = mkN "bhokisi" C5_6 ;
    bread_N = mkN "nkwa" C7_8 ;
    builder_N = mkN "akhi" C1_2 ;
    car_N = mkN "moto" C9_10 ;
    cat_N = mkN "kati" C5_6 ;
    child_N = mkN "ntwana" C1_2 ;
    child_2_N = mkN "ngane" C9_10 ;
    clay_pot_N = mkN "khamba" C11_10 ;
    clothing_N = mkN "ngubo" C9_10 ;
    cow_N = mkN "khomo" C9_10 ;
    customer_N = mkN "thengi" C1_2 ;
    dog_N = mkN "nja" C9_10 ;
    elephant_N = mkN "dlovu" C9_10 ;
    farmer_N = mkN "limi" C1_2 ;
    father_N = mkN "baba" C1_2 ;
    field_N = mkN "simu" C9_6 ;
    finger_N = mkN "nwe" C3_4 ;
    fire_N = mkN "lilo" C3_4 ;
    firewood_N = mkN "khuni" C9_10 ;
    food_N = mkN "dla" C15 ;
    forest_N = mkN "hlathi" C5_6 ;
    gangster_N = mkN "gebengu" C7_8 ;
    gate_N = mkN "sango" C5_6 ;
    girl_N = mkN "thombi" C9_10 ;
    goods_N = mkN "phahla" C9_10 ;
    grandfather_N = mkN "babamkhulu" C1a_2a ;
    grandmother_N = mkN "gogo" C1a_2a ;
    grass_N = mkN "utshani" "utshani" "etshanini" "etshanini" C14 ;
    hare_N = mkN "nogwaja" C1a_2a ;
    herd_boy_N = mkN "umalusi" "abelusi" "kumalusi" "kubelusi" C1_2 ;
    his_father_N = mkN "yise" C1a_2a ;
    home_N = mkN "khaya" "ekhaya" "emakhaya" C5_6 ;
    horse_N = mkN "hhashi" C5_6 ;
    kraal_N = mkN "baya" C7_8 ;
    lion_N = mkN "bhubesi" C5_6 ;
    man_N = mkN "doda" C9_6 ;
    meat_N = mkN "nyama" C9_10 ;
    messenger_N = mkN "gijimi" C7_8 ;
    money_N = mkN "mali" C9_10 ;
    mother_N = mkN "mama" C1a_2a ;
    mountain_N = mkN "ntaba" C9_10 ;
    nonsense_N = mkN "hhala" C5_6 ;
    old_woman_N = mkN "alukazi" C7_8 ;
    overcoat_N = mkN "jezi" C5_6 ;
    ox_N = mkN "khabi" C9_10 ;
    person_N = mkN "ntu" C1_2 ;
    pumpkin_porridge_N = mkN "dudu" C7_8 ;
    river_N = mkN "fula" C3_4 ;
    scholar_N = mkN "fundi" C1_2 ;
    school_N = mkN "kole" C7_8 ;
    sheep_N = mkN "vu" C9_10 ;
    shirt_N = mkN "yembe" C5_6 ;
    sister_N = mkN "dadewenu" C1a_2a ;
    snake_N = mkN "nyoka" C9_10 ;
    soccer_N = mkN "bhola" C5_6 ;
    sore_N = mkN "londa" C7_8 ;
    spoon_N = mkN "khezo" C11_10 ;
    student_N = mkN "tshudeni" C7_8 ;
    table_N = mkN "tafula" C5_6 ;
    thief_N = mkN "sela" C5_6 ;
    town_N = mkN "dolobha" C5_6 ;
    toy_N = mkN "thi" C3_4 ;
    tree_N = mkN "thi" C3_4 ;
    uncle_N = mkN "malume" C1a_2a ;
    village_N = mkN "zi" C3_4 ;
    water_N = mkN "nzi" C5_6 ;
    wife_N = mkN "fazi" C1_2 ;
    window_N = mkN "fasitele" C5_6 ;
    woman_N = mkN "fazi" C1_2 ;
    worker_N = mkN "sebenzi" C7_8 ;
    
    -- verbs
    bark_V = mkV "khonkoth" ;
    be_clean_V = mkV "hlanzek" ;
    become_hungry_V = mkV "lamb" ;
    bite_V2 = mkV2 "lum" ;
    bleed_V = mkV "oph" ;
    break_V2 = mkV2 "ephul" ;
    bring_V = mkV "leth" ;
    build_V = mkV "akh" ;
    build_V2 = mkV2 "akh" ;
    burn_V = mkV "shis" ;
    burn_2_V = mkV "vuth" ;
    buy_V = mkV "theng" ;
    buy_V2 = mkV2 "theng" ;
    call_V2 = mkV2 "biz" ;
    come_V = mkV "z" ;
    cook_V = mkV "phek" ;
    cook_V2 = mkV2 "phek" ;
    cry_V = mkV "khal" ;
    dance_V = mkV "gid" ;
    dance_2_V = mkV "sin" ;
    descend_V = mkV "ehl" ;
    die_V = mkV "f" ;
    distribute_V2 = mkV2 "ab" ;
    do_V = mkV "enz" ;
    do_wrong_V = mkV "on" ;
    drink_V = mkV "phuz" ;
    drink_V2 = mkV2 "phuz" ;
    dry_V = mkV "om" ;
    eat_V = mkV "dl" ;
    eat_V2 = mkV2 "dl" ;
    end_V = mkV "phel" "phela" "phelile" "phele" ;
    enter_V = mkV "ngen" ;
    fall_V = mkV "wel" ;
    fly_V = mkV "ndiz" ;
    gather_firewood_V = mkV "thez" ;
    get_thin_V = mkV "ond" ;
    go_V = mkV "hamb" ;
    go_2_V = mkV "y" ;
    hit_V = mkV "shay" ;
    hit_V2 = mkV2 "shay" ;
    hold_V = mkV "bamb" ;
    jump_over_V2 = mkV2 "eq" ;
    kiss_V2 = mkV2 "ang" ;
    learn_V = mkV "fund" ;
    lift_up_V = mkV "phakamis" ;
    like_V2 = mkV2 "thand" ;
    look_V = mkV "bhek" ;
    look_V2 = mkV2 "bhek" ;
    meet_V = mkV "hlangan" ;
    milk_V = mkV "seng" ;
    open_V2 = mkV2 "vul" ;
    place_across_V2 = mkV2 "gax" ;
    play_V = mkV "dlal" ;
    play_V2 = mkV2 "dlal" ;
    plough_V = mkV "lim" ;
    plough_V2 = mkV2 "lim" ;
    read_V = mkV "fund" ;
    read_V2 = mkV2 "fund" ;
    receive_V2 = mkV2 "amukel" ;
    refuse_V = mkV "al" ;
    refuse_V2 = mkV2 "al" ;
    return_V = mkV "buy" ;
    roast_V = mkV "os" ;
    roast_V2 = mkV2 "os" ;
    rule_V = mkV "bus" ;
    run_V = mkV "gijim" ;
    run_away_V = mkV "balek" ;
    save_V2 = mkV2 "ong" ;
    see_V2 = mkV2 "bon" ;
    shout_V = mkV "memez" ;
    sit_V = mkV "hlal" "hlala" "hlezi" "hlezi" ;
    sleep_V = mkV "lal" ;
    spill_V = mkV "chith" ;
    survive_V = mkV "sind" ;
    stay_V = mkV "sal" ;
    steal_V = mkV "eb" ;
    steal_V2 = mkV2 "eb" ;
    take_V2 = mkV2 "thath" ;
    talk_V = mkV "khulum" ;
    talk_V2 = mkV2 "khulum" ;
    tire_V = mkV "khathal" ;
    tire_2_V = mkV "khathal" ;
    try_V = mkV "zam" ;
    visit_V = mkV "vakash" ;
    visit_V2 = mkV2 "vakashel" ;
    want_V2 = mkV2 "fun" ;
    wash_V2 = mkV2 "gez" ;
    wear_V2 = mkV2 "embath" ;
    work_V = mkV "sebenz" ;
    
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