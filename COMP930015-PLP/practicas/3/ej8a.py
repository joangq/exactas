{
    'rule': implication_introduction,
    'not (P and Q) => not P or not Q': {
        'rule': PBC,
        'not (P and Q) |- not (not P or not Q)': {
            'rule': negation_elimination,
            ('not (P and Q)', 'not P or not Q', '|- bottom'): [
                {'rule': axiom, 
                 ('not (P and Q)', 'not (not P or not Q)', '|- not (P and Q)'): ''},

                {'rule': double_negation_introduction, 
                 ('not (P and Q)', 'not (not P or not Q)', '|- not not (P and Q)'): {
                     'rule': PBC,
                     ('not P and Q', 'not (not P or not Q)', '|- (P and Q)'): {
                         'rule': negation_elimination,
                         ('not (P and Q)', 'not (not P or not Q)', '|- bottom') : [
                             {
                                 'rule': disjunction_introduction_left,
                                 ('not (P and Q)', 'not (not P or not Q)', '|- (not P or not Q)'): {
                                     'rule': negation_introduction,
                                    ('not (P and Q)', 'not (not P or not Q)', 'P', '|- bottom'): { 
                                        'rule': negation_elimination,
                                        ('not (P and Q)', 'not (not P or not Q)', 'P', '|- bottom'): [
                                            {'rule': axiom, 
                                             ('not (P and Q)', 'not (not P or not Q)', 'P', '|- not (P and Q)'): ''},

                                            {'rule': double_negation_introduction,
                                             ('not (P and Q)', 'not (not P or not Q)', 'P', '|- not not (P and Q)'): {
                                                 'rule': PBC,
                                                 ('not (P and Q)', 'not (not P or not Q)', 'P', '|- P and Q'): {
                                                     'rule': negation_elimination,
                                                     ('not (P and Q)', 'not (not P or not Q)', 'P', '|- bottom'): [
                                                            {'rule': axiom,
                                                             ('not (P and Q)', 'not (not P or not Q)', 'P', '|- not (not P or not Q)'): ''},
                                                            
                                                            {'rule': disjunction_introduction_right,
                                                             ('not (P and Q)', 'not (not P or not Q)', 'P', '|- not P or not Q'): {
                                                                    'rule': negation_introduction,
                                                                    ('not (P and Q)', 'not (not P or not Q)', 'P', '|- not Q'): {
                                                                        'rule': negation_elimination,
                                                                        ('not (P and Q)', 'not (not P or not Q)', 'P', 'Q', '|- bottom'): [
                                                                            {'rule': axiom,
                                                                             ('not (P and Q)', 'not (not P or not Q)', 'P', 'Q', '|- Q'): ''},

                                                                             {'rule': negation_introduction,
                                                                              ('not (P and Q)', 'not (not P or not Q)', 'P', 'Q', '|- not Q'): {
                                                                                    'rule': negation_elimination,
                                                                                    ('not (P and Q)', 'not (not P or not Q)', 'P', 'Q', '|- bottom'): [
                                                                                        {'rule': axiom,
                                                                                        ('not (P and Q)', 'not (not P or not Q)', 'P', 'Q', '|- not (P and Q)'): ''},

                                                                                        {'rule': double_negation_introduction,
                                                                                        ('not (P and Q)', 'not (not P or not Q)', 'P', 'Q', '|- not not (P and Q)'): {
                                                                                            'rule': conjunction_introduction,
                                                                                            ('not (P and Q)', 'not (not P or not Q)', 'P', 'Q', '|- (P and Q)'): [
                                                                                                {'rule': axiom,
                                                                                                    ('not (P and Q)', 'not (not P or not Q)', 'P', 'Q', '|- P'): ''},
                                                                                                
                                                                                                {'rule': axiom,
                                                                                                    ('not (P and Q)', 'not (not P or not Q)', 'P', 'Q', '|- Q'): ''},
                                                                                            ]
                                                                                        }
                                                                                        }
                                                                                    ]
                                                                              }
                                                                            }
                                                                        ]
                                                                    }
                                                             }
                                                            }
                                                     ]
                                                 }
                                             }
                                            }
                                        ]
                                    }
                             }},

                             {'rule': axiom,
                              ('not (P and Q)', 'not (not P or not Q)', '|- not (not P or not Q)'): ''}
                         ]
                     }
                     }
                 }
            ]
        }
    }
}