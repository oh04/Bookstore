-- Upgrade only the original plain-text demo passwords; safe to rerun.
-- Customers.Password must hold at least 97 characters.
START TRANSACTION;
UPDATE Customers SET Password = 'c6a3dbdd11d0b768fb8c357730b31742:287a0ac6158be30d1f96896e3550a393148899207992ef9802bf2071446e8783' WHERE CustomerID = 1 AND Email = 'layla.reed@example.com' AND Password = 'demo123';
UPDATE Customers SET Password = '30ee57351827e3d48c900f2a9e3980f6:383e9af1161850dd5b5f50f225e5f29cc10817d53a6f3ca6df7c1ba99740687e' WHERE CustomerID = 2 AND Email = 'ethan.cruz@example.com' AND Password = 'demo123';
UPDATE Customers SET Password = 'b2c50e1aa757464f18e300397e989175:ecd5de33544c381c331c3d62e84d3024c673777a8cd5b06d1e81a50dc2afcb7e' WHERE CustomerID = 3 AND Email = 'hana.yusuf@example.com' AND Password = 'demo123';
UPDATE Customers SET Password = 'ecfea66981e21cda3aaf7eaf81adb6a9:b62a3118bbd11091f920946399d20f9e87649a9feb52cd64a3f9ed7cc89900cc' WHERE CustomerID = 4 AND Email = 'noah.james@example.com' AND Password = 'demo123';
UPDATE Customers SET Password = '4c83f6a195319cebc433355b33853064:63a3abc1f24a1a27b065f8f95525039676b5b10a6ff2be3d1754d4b68fde3c91' WHERE CustomerID = 5 AND Email = 'mia.santos@example.com' AND Password = 'demo123';
UPDATE Customers SET Password = 'f850bbc91aa18bd1ac22ae31e32e5781:ea17756581a3506af1d8b88a79ca11612625715ee0a2343a3ce810704f598da9' WHERE CustomerID = 6 AND Email = 'adam.saleh@example.com' AND Password = 'demo123';
UPDATE Customers SET Password = '33654cefb4209a84578103bc4e96a351:afdf5d151bc85eabfe5042b1ac9ba68883d2a57517ccae9f779af39147d7e9ad' WHERE CustomerID = 7 AND Email = 'sana.ali@example.com' AND Password = 'demo123';
UPDATE Customers SET Password = '4915df00f002894389fbe059ff2dc82c:5b746386bc8a347d0d8fe586a9ef4613f19bf670534ea2399a6fa62d1e42116b' WHERE CustomerID = 8 AND Email = 'olivia.nguyen@example.com' AND Password = 'demo123';
UPDATE Customers SET Password = '74c6194400544344b49bcdbaeea83f57:3e34da81cdabb233b90e7cf7f4e74c1cc618c2570bf2aca3e2b9e0ac46f1f841' WHERE CustomerID = 9 AND Email = 'theo.martin@example.com' AND Password = 'demo123';
UPDATE Customers SET Password = '639088fb8c1b7de7afebce3757196cbe:7252be0bbbff49a9b47d6208ade697fa4d972207d3c7b41dd546195052cae905' WHERE CustomerID = 10 AND Email = 'ava.brooks@example.com' AND Password = 'demo123';
UPDATE Customers SET Password = '329ead1b6294ae3460a55e63537993f0:ea4f3f912cc681ea9712c241757b0fa150261bf05ed378e378371f7967c4357a' WHERE CustomerID = 11 AND Email = 'lucas.park@example.com' AND Password = 'demo123';
UPDATE Customers SET Password = '476d5e8b6946454d2949deb26162eb67:7540d930989ef034b9e024195fe90679a8e1b3618e8f18f59a610e357a8dac77' WHERE CustomerID = 12 AND Email = 'zoe.shah@example.com' AND Password = 'demo123';
UPDATE Customers SET Password = '55b944054392bb16dae04cd1a4064257:dc3e42cab38d3079344d2a8bbba82c2f1336c228ad1dd4749f441ac191208681' WHERE CustomerID = 13 AND Email = 'jack.rivera@example.com' AND Password = 'demo123';
UPDATE Customers SET Password = '93a16c1c2d6af767a062cc8e1496b6d8:cbdf9c767e5fc1ba3f8f841b85c15b7186f6b434467cebc1a4f3553f86d41fbc' WHERE CustomerID = 14 AND Email = 'isabel.chen@example.com' AND Password = 'demo123';
UPDATE Customers SET Password = '67354c1fb99340d457c4396772fbc9b3:d51416749f1ac4962e154d84546b7df366c88a3c28333f3aa40bf961ff87b896' WHERE CustomerID = 15 AND Email = 'liam.foster@example.com' AND Password = 'demo123';
COMMIT;
