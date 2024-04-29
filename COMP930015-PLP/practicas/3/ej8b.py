{'rule': implication_introduction,
     'not P or not Q => not (P and Q)': {
         'rule': negation_introduction,
         'not P or not Q |- not (P and Q)': {
             'rule': negation_elimination,
             ('not P or not Q', 'P and Q', '|- bottom'): [
                 {'rule': axiom, 
                  ('not P or not Q', 'P and Q', '|- not P or not Q'): ''},
                 {'rule': negation_elimination,
                  ('not P or not Q','P and Q |- not P or not Q'): [
                      {'rule': axiom,
                       ('not P or not Q', 'P and Q', '|- not P or not Q'): ''},

                      # Este paso está raro, la eliminación de la negación tiene dos premisas,
                      # que Gamma valide tau y no tau. Acá hay tres. (?)
                      # Lo dejo porque probablemente se pueda loopear hasta la misma conclusión,
                      # y hacer el camino del arbol derecho (con Q), y terminar con la misma deducción.

                      {'rule': negation_introduction,
                       ('not P or not Q', 'P and Q', 'not P', '|- not (not P or not Q)'): 
                       {'rule': negation_elimination,
                        ('not P or not Q', 'P and Q', 'not P', '|- bottom'): [
                            {'rule': axiom,
                             ('not P or not Q', 'P and Q', 'not P', '|- not P'): ''},
                            
                            {'rule': conjunction_elimination_left,
                             ('not P or not Q', 'P and Q', 'not P', '|- P'): {
                                 'rule': axiom,
                                 ('not P or not Q', 'P and Q', 'not P', '|- P and Q'): '',
                             }
                            }
                        ]
                       }
                      },
                      
                      {'rule': negation_introduction,
                       ('not P or not Q', 'P and Q', 'not Q', '|- not (not P or not Q)'): 
                       {'rule': negation_elimination,
                        ('not P or not Q', 'P and Q', 'not Q', '|- bottom'): [
                            {'rule': axiom,
                             ('not P or not Q', 'P and Q', 'not Q', '|- not Q'): ''},
                            
                            {'rule': conjunction_elimination_left,
                             ('not P or not Q', 'P and Q', 'not Q', '|- Q'): {
                                 'rule': axiom,
                                 ('not P or not Q', 'P and Q', 'not Q', '|- P and Q'): '',
                             }
                            }
                        ]
                       }
                      },
                  ]
                 }
             ]
         }
     }
}